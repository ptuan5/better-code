# This script identifies genes with differential expression between Control and
# Treatment samples and prints the significant-gene count plus a result preview.

df <- read.csv("simulated_expression_matrix.csv", row.names = 1)

#' Identifies genes with differential expression between two groups (e.g., Control vs Treatment)
#' using log2-transformed data, t-tests, and BH-adjusted p-values.
#'
#' @param expression_matrix Numeric matrix/data frame (genes = rows, samples = columns).
#'   Column names must encode group labels (e.g., "Control_1").
#' @param alpha Significance threshold for adjusted p-values (default = 0.05).
#'
#' @return Data frame of significant genes (padj < alpha) with p-values, adjusted p-values,
#'   group means, and log2 fold change.
#'
#' @details Assumes exactly two groups inferred from sample names.
find_de_genes <- function(expression_matrix, alpha = 0.05) {
  library(reshape2)
  library(dplyr)

  # Log 2 transformation
  log_expression_matrix <- log2(expression_matrix + 1)
  log_expression_matrix$gene <- rownames(log_expression_matrix)

  # Reshape to long format
  expression_long <- reshape2::melt(log_expression_matrix,
                                    id.vars = "gene",
                                    variable.name = "sample",
                                    value.name = "log_expression")

  # Infer group (control or treatment) from sample names
  expression_long$group <- sapply(strsplit(as.character(expression_long$sample), "_"), `[`, 1)

  # Perform t-test for each gene
  gene_pvalues <- lapply(
    split(expression_long, expression_long$gene),
    function(gene_data) {
      t.test(log_expression ~ group, data = gene_data)$p.value
    }
  )
  gene_pvalues <- unlist(gene_pvalues)
  adjusted_pvalues <- p.adjust(gene_pvalues, method = "BH")

  # Calculate group mean normalized expressions
  group_means <- expression_long %>%
    dplyr::group_by(gene, group) %>%
    dplyr::summarise(mean_log_expression = mean(log_expression), .groups = "drop")
  
  mean_summary <- reshape2::dcast(group_means,gene ~ group, value.var = "mean_log_expression")
  # Assuming the groups are named "Control" and "Treatment", calculate fold change
  mean_summary$fc <- mean_summary$Treatment - mean_summary$Control

  # Compile results
  gene_results <- data.frame(gene = names(gene_pvalues),
                             pval = gene_pvalues,
                             padj = adjusted_pvalues) %>%
    merge(mean_summary, by = "gene") %>%
    arrange(pval)

  significant_genes <- gene_results[gene_results$padj < alpha, ]
  return(significant_genes)
}

res <- find_de_genes(df, alpha = 0.05)
cat("Number of significant genes:", nrow(res), "\n")
cat("First few significant genes:\n")
print(head(res))
