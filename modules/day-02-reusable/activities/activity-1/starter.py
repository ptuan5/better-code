import math
import random


rng = random.Random(42)

tissues = ["Adipose Subcutaneous", "Liver", "Muscle Skeletal"]
genes = ["LIF"] + [f"Gene_{index:03d}" for index in range(1, 100)]
samples = [f"Sample_{index:02d}" for index in range(1, 11)]

target_gene = "LIF"
correlation_threshold = 0.75

common_partner_genes = {"Gene_005", "Gene_017", "Gene_042", "Gene_073"}
adipose_partner_genes = {"Gene_012", "Gene_027"}
liver_partner_genes = {"Gene_033", "Gene_061"}
muscle_partner_genes = {"Gene_014", "Gene_088"}


def scale_values(values):
    mean_value = sum(values) / len(values)
    variance = sum((value - mean_value) ** 2 for value in values) / (len(values) - 1)
    standard_deviation = math.sqrt(variance)
    return [(value - mean_value) / standard_deviation for value in values]


def pearson_correlation(x_values, y_values):
    x_mean = sum(x_values) / len(x_values)
    y_mean = sum(y_values) / len(y_values)

    numerator = sum(
        (x_value - x_mean) * (y_value - y_mean)
        for x_value, y_value in zip(x_values, y_values)
    )
    x_sum_squares = sum((x_value - x_mean) ** 2 for x_value in x_values)
    y_sum_squares = sum((y_value - y_mean) ** 2 for y_value in y_values)

    return numerator / math.sqrt(x_sum_squares * y_sum_squares)


def build_tissue_expression(tissue_name, tissue_index):
    tissue_signal = scale_values([rng.gauss(0, 1) for _ in samples])
    tissue_expression = {}

    for gene_index, gene_name in enumerate(genes, start=1):
        baseline = 8 + tissue_index * 0.6 + gene_index / 30
        effect_size = 0
        noise_sd = 0.8

        if gene_name == target_gene:
            effect_size = 1.8
            noise_sd = 0.15
        elif gene_name in common_partner_genes:
            effect_size = 1.3
            noise_sd = 0.25
        elif tissue_name == "Adipose Subcutaneous" and gene_name in adipose_partner_genes:
            effect_size = 1.1
            noise_sd = 0.3
        elif tissue_name == "Liver" and gene_name in liver_partner_genes:
            effect_size = -1.1
            noise_sd = 0.3
        elif tissue_name == "Muscle Skeletal" and gene_name in muscle_partner_genes:
            effect_size = 1.15
            noise_sd = 0.3

        tissue_expression[gene_name] = [
            round(
                baseline + effect_size * tissue_signal[sample_index] + rng.gauss(0, noise_sd),
                2,
            )
            for sample_index in range(len(samples))
        ]

    return tissue_expression


expression_by_tissue = {
    tissue: build_tissue_expression(tissue, tissue_index)
    for tissue_index, tissue in enumerate(tissues, start=1)
}

adipose_expression = expression_by_tissue["Adipose Subcutaneous"]
adipose_target = adipose_expression[target_gene]
adipose_results = []
for gene_name, gene_values in adipose_expression.items():
    adipose_results.append(
        {
            "gene": gene_name,
            "correlation": pearson_correlation(adipose_target, gene_values),
            "mean_expression": sum(gene_values) / len(gene_values),
        }
    )
adipose_hits = [
    row
    for row in adipose_results
    if row["gene"] != target_gene and abs(row["correlation"]) >= correlation_threshold
]

liver_expression = expression_by_tissue["Liver"]
liver_target = liver_expression[target_gene]
liver_results = []
for gene_name, gene_values in liver_expression.items():
    liver_results.append(
        {
            "gene": gene_name,
            "correlation": pearson_correlation(liver_target, gene_values),
            "mean_expression": sum(gene_values) / len(gene_values),
        }
    )
liver_hits = [
    row
    for row in liver_results
    if row["gene"] != target_gene and abs(row["correlation"]) >= correlation_threshold
]

muscle_expression = expression_by_tissue["Muscle Skeletal"]
muscle_target = muscle_expression[target_gene]
muscle_results = []
for gene_name, gene_values in muscle_expression.items():
    muscle_results.append(
        {
            "gene": gene_name,
            "correlation": pearson_correlation(muscle_target, gene_values),
            "mean_expression": sum(gene_values) / len(gene_values),
        }
    )
muscle_hits = [
    row
    for row in muscle_results
    if row["gene"] != target_gene and abs(row["correlation"]) >= correlation_threshold
]

shared_hits = sorted(
    set(row["gene"] for row in adipose_hits)
    & set(row["gene"] for row in liver_hits)
    & set(row["gene"] for row in muscle_hits)
)

print(f"Target gene: {target_gene}")
print(f"Absolute correlation threshold: {correlation_threshold}")
print(f"Adipose significant genes: {len(adipose_hits)}")
print(f"Liver significant genes: {len(liver_hits)}")
print(f"Muscle significant genes: {len(muscle_hits)}")
print("Genes that pass the threshold in all 3 tissues:")
print(shared_hits)
