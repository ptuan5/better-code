# Demo script for Day 2: repeated workflow before function extraction.

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

adipose_rows <- lif_correlations[lif_correlations$tissue == "Adipose Subcutaneous", ]
adipose_hits <- adipose_rows[adipose_rows$gene != "LIF" & adipose_rows$correlation >= 0.4, ]
adipose_top_gene <- adipose_hits$gene[which.max(adipose_hits$correlation)]
adipose_summary <- paste(
  "Adipose Subcutaneous strong genes =",
  nrow(adipose_hits),
  "| top partner =",
  adipose_top_gene,
  "| average correlation =",
  round(mean(adipose_hits$correlation), 2),
  "| average expression =",
  round(mean(adipose_hits$mean_tpm), 1)
)

liver_rows <- lif_correlations[lif_correlations$tissue == "Liver", ]
liver_hits <- liver_rows[liver_rows$gene != "LIF" & liver_rows$correlation >= 0.4, ]
liver_top_gene <- liver_hits$gene[which.max(liver_hits$correlation)]
liver_summary <- paste(
  "Liver strong genes =",
  nrow(liver_hits),
  "| top partner =",
  liver_top_gene,
  "| average correlation =",
  round(mean(liver_hits$correlation), 2),
  "| average expression =",
  round(mean(liver_hits$mean_tpm), 1)
)

muscle_rows <- lif_correlations[lif_correlations$tissue == "Muscle Skeletal", ]
muscle_hits <- muscle_rows[muscle_rows$gene != "LIF" & muscle_rows$correlation >= 0.4, ]
muscle_top_gene <- muscle_hits$gene[which.max(muscle_hits$correlation)]
muscle_summary <- paste(
  "Muscle Skeletal strong genes =",
  nrow(muscle_hits),
  "| top partner =",
  muscle_top_gene,
  "| average correlation =",
  round(mean(muscle_hits$correlation), 2),
  "| average expression =",
  round(mean(muscle_hits$mean_tpm), 1)
)

cat("Tissue summaries\n")
cat(adipose_summary, "\n")
cat(liver_summary, "\n")
cat(muscle_summary, "\n")
