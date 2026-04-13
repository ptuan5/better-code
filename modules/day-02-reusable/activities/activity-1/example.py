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


def filter_strong_hits(rows, tissue_name, min_correlation=0.4):
    return [
        row
        for row in rows
        if row["tissue"] == tissue_name
        and row["gene"] != "LIF"
        and row["correlation"] >= min_correlation
    ]


def summarize_tissue(rows, tissue_name, min_correlation=0.4):
    strong_hits = filter_strong_hits(rows, tissue_name, min_correlation)
    top_partner = max(strong_hits, key=lambda row: row["correlation"])["gene"]
    return {
        "tissue": tissue_name,
        "strong_gene_count": len(strong_hits),
        "top_partner": top_partner,
        "average_correlation": sum(row["correlation"] for row in strong_hits)
        / len(strong_hits),
        "average_expression": sum(row["mean_tpm"] for row in strong_hits)
        / len(strong_hits),
    }


def format_summary(summary_result):
    return (
        f'{summary_result["tissue"]} strong genes = '
        f'{summary_result["strong_gene_count"]} | '
        f'top partner = {summary_result["top_partner"]} | '
        f'average correlation = {summary_result["average_correlation"]:.2f} | '
        f'average expression = {summary_result["average_expression"]:.1f}'
    )


tissues_to_summarize = [
    "Adipose Subcutaneous",
    "Liver",
    "Muscle Skeletal",
]

print("Tissue summaries")
for tissue_name in tissues_to_summarize:
    summary = summarize_tissue(lif_correlations, tissue_name)
    print(format_summary(summary))
