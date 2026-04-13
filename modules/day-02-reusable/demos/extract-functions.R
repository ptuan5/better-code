# Demo script for Day 2: extracting helper functions from a readable
# differential-expression workflow.

data_path <- "modules/day-01-readable/activities/activity-2/simulated_expression_matrix.csv"
df <- read.csv(data_path, row.names = 1)

prepare_expression_data <- function(expression_matrix) {
  log_expression_matrix <- log2(expression_matrix + 1)
  log_expression_matrix$gene <- rownames(log_expression_matrix)

  expression_long <- reshape2::melt(
    log_expression_matrix,
    id.vars = "gene",
    variable.name = "sample",
    value.name = "log_expression"
  )

  expression_long$group <- vapply(
    strsplit(as.character(expression_long$sample), "_"),
    `[`,
    character(1),
    1
  )

  expression_long
}

compute_gene_pvalues <- function(expression_long) {
  gene_pvalues <- lapply(
    split(expression_long, expression_long$gene),
    function(gene_data) {
      t.test(log_expression ~ group, data = gene_data)$p.value
    }
  )

  gene_pvalues <- unlist(gene_pvalues)

  data.frame(
    gene = names(gene_pvalues),
    pval = gene_pvalues,
    padj = p.adjust(gene_pvalues, method = "BH")
  )
}

summarize_group_means <- function(expression_long) {
  group_means <- dplyr::summarise(
    dplyr::group_by(expression_long, gene, group),
    mean_log_expression = mean(log_expression),
    .groups = "drop"
  )

  mean_summary <- reshape2::dcast(
    group_means,
    gene ~ group,
    value.var = "mean_log_expression"
  )

  mean_summary$fc <- mean_summary$Treatment - mean_summary$Control
  mean_summary
}

build_gene_results <- function(pvalue_summary, mean_summary) {
  gene_results <- merge(pvalue_summary, mean_summary, by = "gene")
  dplyr::arrange(gene_results, pval)
}

find_de_genes <- function(expression_matrix, alpha = 0.05) {
  expression_long <- prepare_expression_data(expression_matrix)
  pvalue_summary <- compute_gene_pvalues(expression_long)
  mean_summary <- summarize_group_means(expression_long)
  gene_results <- build_gene_results(pvalue_summary, mean_summary)

  gene_results[gene_results$padj < alpha, ]
}

res <- find_de_genes(df, alpha = 0.05)
cat("Number of significant genes:", nrow(res), "\n")
cat("First few significant genes:\n")
print(head(res))
