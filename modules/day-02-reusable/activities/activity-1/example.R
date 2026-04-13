library(dplyr)
library(tidyr)
library(ggplot2)

# Refactored example for the repeated per-tissue correlation workflow.
# This version keeps the same analysis but makes the target gene and
# correlation threshold easy to change at the top of the script.
data_dir <- "modules/day-02-reusable/activities/activity-1/mock_data_3_tissues"
tissue_files <- c(
  Adipose = "Adipose.csv",
  Liver = "Liver.csv",
  Muscle = "Muscle.csv"
)

target_gene <- "LIF"
correlation_threshold <- 0.5

# Load each tissue-specific expression table into a named list.
load_expression_data <- function(data_dir, tissue_files) {
  setNames(
    lapply(tissue_files, function(file_name) {
      read.csv(file.path(data_dir, file_name))
    }),
    names(tissue_files)
  )
}

# Extract one tissue's correlations with the selected target gene.
extract_target_correlations <- function(expression_data, tissue_name, target_gene) {
  rownames(expression_data) <- expression_data$Gene
  sample_columns <- setdiff(names(expression_data), "Gene")
  correlation_matrix <- cor(t(expression_data[, sample_columns]))

  data.frame(
    Gene = rownames(correlation_matrix),
    correlation_matrix[, target_gene]
  ) %>%
    setNames(c("Gene", tissue_name))
}

# Keep only the genes that stay above the correlation threshold in all tissues.
find_shared_high_correlation_genes <- function(correlation_tables, target_gene, correlation_threshold) {
  combined_correlations <- Reduce(
    function(left_table, right_table) merge(left_table, right_table, by = "Gene"),
    correlation_tables
  ) %>%
    filter(Gene != target_gene)

  combined_correlations %>%
    filter(if_all(-Gene, ~ .x > correlation_threshold))
}

# Build one plot per tissue for the target gene and the shared high-correlation genes.
plot_shared_gene_expression <- function(expression_by_tissue, shared_gene_table, target_gene) {
  genes_to_plot <- c(shared_gene_table$Gene, target_gene)

  setNames(
    lapply(names(expression_by_tissue), function(tissue_name) {
      tissue_expression <- expression_by_tissue[[tissue_name]]
      tissue_expression_long <- tissue_expression %>%
        filter(Gene %in% genes_to_plot) %>%
        pivot_longer(cols = -Gene, names_to = "Sample", values_to = "Expression")

      ggplot(tissue_expression_long, aes(x = Sample, y = Expression, color = Gene, group = Gene)) +
        geom_point() +
        geom_line() +
        theme_bw() +
        labs(title = paste("Expression of Highly Correlated Genes in", tissue_name, "Tissue"))
    }),
    names(expression_by_tissue)
  )
}

# Run the reusable workflow.
expression_by_tissue <- load_expression_data(data_dir, tissue_files)

target_gene_correlations <- lapply(
  names(expression_by_tissue),
  function(tissue_name) {
    extract_target_correlations(expression_by_tissue[[tissue_name]], tissue_name, target_gene)
  }
)

shared_highly_correlated_genes <- find_shared_high_correlation_genes(
  target_gene_correlations,
  target_gene,
  correlation_threshold
)
print(shared_highly_correlated_genes)

per_tissue_plots <- plot_shared_gene_expression(
  expression_by_tissue,
  shared_highly_correlated_genes,
  target_gene
)
