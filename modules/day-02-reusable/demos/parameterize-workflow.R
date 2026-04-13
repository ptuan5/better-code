# Demo script for Day 2: useful refactor before parameterization.

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

summarize_liver <- function(data) {
  liver_rows <- data[data$tissue == "Liver", ]
  liver_hits <- liver_rows[liver_rows$gene != "LIF" & liver_rows$correlation >= 0.4, ]
  liver_top_gene <- liver_hits$gene[which.max(liver_hits$correlation)]

  paste(
    "Liver strong genes =",
    nrow(liver_hits),
    "| top partner =",
    liver_top_gene,
    "| average correlation =",
    round(mean(liver_hits$correlation), 2),
    "| average expression =",
    round(mean(liver_hits$mean_tpm), 1)
  )
}

cat("Current summary\n")
cat(summarize_liver(lif_correlations), "\n")
