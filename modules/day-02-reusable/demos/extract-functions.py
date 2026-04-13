# Demo script for Day 2: repeated workflow before function extraction.

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

adipose_rows = [row for row in lif_correlations if row["tissue"] == "Adipose Subcutaneous"]
adipose_hits = [
    row for row in adipose_rows if row["gene"] != "LIF" and row["correlation"] >= 0.4
]
adipose_top_gene = max(adipose_hits, key=lambda row: row["correlation"])["gene"]
adipose_summary = (
    f"Adipose Subcutaneous strong genes = {len(adipose_hits)} | "
    f"top partner = {adipose_top_gene} | "
    f"average correlation = "
    f'{sum(row["correlation"] for row in adipose_hits) / len(adipose_hits):.2f} | '
    f'average expression = {sum(row["mean_tpm"] for row in adipose_hits) / len(adipose_hits):.1f}'
)

liver_rows = [row for row in lif_correlations if row["tissue"] == "Liver"]
liver_hits = [
    row for row in liver_rows if row["gene"] != "LIF" and row["correlation"] >= 0.4
]
liver_top_gene = max(liver_hits, key=lambda row: row["correlation"])["gene"]
liver_summary = (
    f"Liver strong genes = {len(liver_hits)} | "
    f"top partner = {liver_top_gene} | "
    f"average correlation = "
    f'{sum(row["correlation"] for row in liver_hits) / len(liver_hits):.2f} | '
    f'average expression = {sum(row["mean_tpm"] for row in liver_hits) / len(liver_hits):.1f}'
)

muscle_rows = [row for row in lif_correlations if row["tissue"] == "Muscle Skeletal"]
muscle_hits = [
    row for row in muscle_rows if row["gene"] != "LIF" and row["correlation"] >= 0.4
]
muscle_top_gene = max(muscle_hits, key=lambda row: row["correlation"])["gene"]
muscle_summary = (
    f"Muscle Skeletal strong genes = {len(muscle_hits)} | "
    f"top partner = {muscle_top_gene} | "
    f"average correlation = "
    f'{sum(row["correlation"] for row in muscle_hits) / len(muscle_hits):.2f} | '
    f'average expression = {sum(row["mean_tpm"] for row in muscle_hits) / len(muscle_hits):.1f}'
)

print("Tissue summaries")
print(adipose_summary)
print(liver_summary)
print(muscle_summary)
