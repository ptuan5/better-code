lif_correlations <- data.frame(
  tissue = c(
    "Adipose Subcutaneous", "Adipose Subcutaneous", "Adipose Subcutaneous", "Adipose Subcutaneous",
    "Liver", "Liver", "Liver", "Liver",
    "Muscle Skeletal", "Muscle Skeletal", "Muscle Skeletal", "Muscle Skeletal"
  ),
  gene = c(
    "LIF", "IL6", "SOCS3", "CPT1A",
    "LIF", "FGF21", "PCK1", "CEBPA",
    "LIF", "STAT3", "TRIM63", "MYH7"
  ),
  correlation = c(
    1.00, 0.62, 0.52, -0.14,
    1.00, 0.58, 0.44, -0.20,
    1.00, 0.71, 0.53, -0.33
  ),
  mean_tpm = c(
    12.4, 8.1, 7.8, 20.2,
    14.1, 10.9, 16.5, 18.0,
    5.4, 6.9, 4.8, 22.4
  )
)

filter_strong_hits <- function(data, tissue_name, min_correlation = 0.4) {
  tissue_rows <- data[data$tissue == tissue_name, ]
  tissue_rows[tissue_rows$gene != "LIF" & tissue_rows$correlation >= min_correlation, ]
}

summarize_tissue <- function(data, tissue_name, min_correlation = 0.4) {
  strong_hits <- filter_strong_hits(data, tissue_name, min_correlation)
  top_partner <- strong_hits$gene[which.max(strong_hits$correlation)]
  list(
    tissue = tissue_name,
    strong_gene_count = nrow(strong_hits),
    top_partner = top_partner,
    average_correlation = mean(strong_hits$correlation),
    average_expression = mean(strong_hits$mean_tpm)
  )
}

format_summary <- function(summary_result) {
  sprintf(
    "%s strong genes = %d | top partner = %s | average correlation = %.2f | average expression = %.1f",
    summary_result$tissue,
    summary_result$strong_gene_count,
    summary_result$top_partner,
    summary_result$average_correlation,
    summary_result$average_expression
  )
}

tissues_to_summarize <- c(
  "Adipose Subcutaneous",
  "Liver",
  "Muscle Skeletal"
)

cat("Tissue summaries\n")
for (tissue_name in tissues_to_summarize) {
  tissue_summary <- summarize_tissue(lif_correlations, tissue_name)
  cat(format_summary(tissue_summary), "\n")
}
