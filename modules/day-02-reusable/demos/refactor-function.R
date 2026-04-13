# Demo script for Day 2: extracting helper functions from a readable
# differential-expression workflow.
library(dplyr)
library(reshape2)


df <- read.csv("simulated_expression_matrix.csv", row.names = 1)

prepare_expression_data <- function(expression_matrix) {
  # Prepare the expression matrix for per-gene testing by log-transforming the 
  # values, reshaping to long format, and pulling the group label from the sample name.
  
  log_expression_matrix <- log2(expression_matrix + 1)
  log_expression_matrix$gene <- rownames(log_expression_matrix)
  
  expression_long <- reshape2::melt(log_expression_matrix,
                                    id.vars = "gene",
                                    variable.name = "sample",
                                    value.name = "log_expression")
  
  # Infer group (control or treatment) from sample names
  expression_long$group <- sapply(strsplit(as.character(expression_long$sample), "_"), `[`, 1)

  return(expression_long)
}

compute_single_gene_stats <- function(gene_data) {
  # Run one t-test for a single gene and keep the values we want in the final
  # results table. This version takes the group means directly from the t-test object.
  
  ttest_single_gene <- t.test(log_expression ~ group, data = gene_data)
  means <- unname(ttest_single_gene$estimate)
  
  summary_stats <- data.frame(pval = ttest_single_gene$p.value,
                              Control = means[1],
                              Treatment = means[2],
                              fc = means[2] - means[1])
  return(summary_stats)
}

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
  
  expression_long <- prepare_expression_data(expression_matrix)
  
  # Apply the per-gene t-test function and combine the results into a single data frame.
  gene_stats <- lapply(
    split(expression_long, expression_long$gene), 
    compute_single_gene_stats
  ) %>%
    bind_rows(.id = "gene")
  
  gene_stats$padj <- p.adjust(gene_stats$pval, method = "BH")
  
  significant_genes <- gene_stats %>%
    filter(padj < alpha) %>%
    arrange(pval)
  
  return(significant_genes)
}

res <- find_de_genes(df, alpha = 0.05)
cat("Number of significant genes:", nrow(res), "\n")
cat("First few significant genes:\n")
print(head(res))
