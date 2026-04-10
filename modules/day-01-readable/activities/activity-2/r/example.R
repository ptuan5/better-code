# Prioritize a small set of genes for follow-up plots.

gene_names <- c("LIF", "SOCS3", "STAT3", "MALAT1", "IL6", "NEAT1")
mean_signal <- c(10.4, 9.7, 8.9, 7.5, 6.8, 8.1)
signal_spread <- c(2.1, 1.8, 1.6, 0.7, 2.4, 1.1)
zero_sample_count <- c(0, 0, 1, 2, 3, 1)
followup_bonus <- c(2, 2, 1, 0, 3, 1)

calculate_priority_score <- function(mean_signal, signal_spread, zero_sample_count, followup_bonus) {
  raw_score <- (mean_signal * 1.2) + (signal_spread * 3) + followup_bonus - (zero_sample_count * 1.5)
  min(raw_score, 20)
}

priority_label <- function(priority_score) {
  if (priority_score >= 15) {
    return("plot")
  }

  if (priority_score >= 11) {
    return("check")
  }

  "ignore"
}

gene_summary <- data.frame(
  gene_name = gene_names,
  mean_signal = mean_signal,
  signal_spread = signal_spread,
  zero_sample_count = zero_sample_count,
  followup_bonus = followup_bonus
)

gene_summary$priority_score <- mapply(
  calculate_priority_score,
  gene_summary$mean_signal,
  gene_summary$signal_spread,
  gene_summary$zero_sample_count,
  gene_summary$followup_bonus
)

cat("Gene follow-up priorities\n")

for (row_index in seq_len(nrow(gene_summary))) {
  gene_name <- gene_summary$gene_name[row_index]
  label <- priority_label(gene_summary$priority_score[row_index])
  cat(gene_name, label, "\n")
}

average_priority_score <- mean(gene_summary$priority_score)
priority_labels <- vapply(gene_summary$priority_score, priority_label, character(1))
label_counts <- table(factor(priority_labels, levels = c("plot", "check", "ignore")))

cat("Average priority score:", average_priority_score, "\n")
cat(
  "Counts by label:",
  "plot =", label_counts["plot"],
  "check =", label_counts["check"],
  "ignore =", label_counts["ignore"],
  "\n"
)
