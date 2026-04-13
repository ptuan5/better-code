# Demo script for Day 2: useful refactor before parameterization.

lif_correlations = [
    {"tissue": "Adipose Subcutaneous", "gene": "LIF", "correlation": 1.00, "mean_tpm": 12.4},
    {"tissue": "Adipose Subcutaneous", "gene": "IL6", "correlation": 0.62, "mean_tpm": 8.1},
    {"tissue": "Adipose Subcutaneous", "gene": "SOCS3", "correlation": 0.52, "mean_tpm": 7.8},
    {"tissue": "Adipose Subcutaneous", "gene": "CPT1A", "correlation": -0.14, "mean_tpm": 20.2},
    {"tissue": "Liver", "gene": "LIF", "correlation": 1.00, "mean_tpm": 14.1},
    {"tissue": "Liver", "gene": "FGF21", "correlation": 0.58, "mean_tpm": 10.9},
    {"tissue": "Liver", "gene": "PCK1", "correlation": 0.44, "mean_tpm": 16.5},
    {"tissue": "Liver", "gene": "CEBPA", "correlation": -0.20, "mean_tpm": 18.0},
    {"tissue": "Muscle Skeletal", "gene": "LIF", "correlation": 1.00, "mean_tpm": 5.4},
    {"tissue": "Muscle Skeletal", "gene": "STAT3", "correlation": 0.71, "mean_tpm": 6.9},
    {"tissue": "Muscle Skeletal", "gene": "TRIM63", "correlation": 0.53, "mean_tpm": 4.8},
    {"tissue": "Muscle Skeletal", "gene": "MYH7", "correlation": -0.33, "mean_tpm": 22.4},
]


def summarize_liver(rows):
    liver_rows = [row for row in rows if row["tissue"] == "Liver"]
    liver_hits = [
        row for row in liver_rows if row["gene"] != "LIF" and row["correlation"] >= 0.4
    ]
    liver_top_gene = max(liver_hits, key=lambda row: row["correlation"])["gene"]

    return (
        f"Liver strong genes = {len(liver_hits)} | "
        f"top partner = {liver_top_gene} | "
        f"average correlation = "
        f'{sum(row["correlation"] for row in liver_hits) / len(liver_hits):.2f} | '
        f'average expression = {sum(row["mean_tpm"] for row in liver_hits) / len(liver_hits):.1f}'
    )


print("Current summary")
print(summarize_liver(lif_correlations))
