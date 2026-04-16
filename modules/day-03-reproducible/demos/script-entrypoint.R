#!/usr/bin/env Rscript
# ------------------------------------------------------------------------------
# script-entrypoint.R
#
# This script:
#   - Loads gene expression data from multiple tissues
#   - Computes correlations with a target gene
#   - Identifies genes consistently highly correlated across tissues
#   - Exports results to CSV
#   - Saves expression plots to a multi-page PDF
#
# Usage:
#   Rscript script.R --data_dir <path> --target_gene <gene> --output_dir <path>
# ------------------------------------------------------------------------------

suppressWarnings(
  suppressMessages({
    library(optparse)
    library(tidyr)
    library(tibble)
    library(dplyr)
    library(ggplot2)
}))

##### Argument parsing with optparse ---
option_list <- list(
  make_option("--data_dir", type = "character",
              help = "Directory containing tissue CSV files [required"),
  make_option("--target_gene", type = "character",
              help = "Target gene for correlation analysis [required]"),
  make_option("--output_dir", type = "character",
              help = "Directory to write output files [required]"),
  make_option("--correlation_threshold", type = "double", default = 0.5,
              help = "Correlation threshold [default %default]"),
)

parser <- OptionParser(
  option_list = option_list,
  description = "Find genes correlated with a target gene across tissues and plot their expressions"
)

opt <- parse_args(parser)

# Extract arguments
data_dir <- opt$data_dir
target_gene <- opt$target_gene
correlation_threshold <- opt$correlation_threshold
output_dir <- opt$output_dir

# Validate required arguments
if (is.null(data_dir) || is.null(target_gene) || is.null(output_dir)) {
  cat("Error: --data_dir, --target_gene, and --output_dir are required.\n\n")
  print_help(parser)
  quit(status = 1)
}

dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

##### Helper functions for the workflow ----
extract_target_correlations <- function(expression_data, target_gene) {
  expression_matrix <- expression_data %>%
    tibble::column_to_rownames("Gene")
  
  cor_matrix <- cor(t(expression_matrix)) %>%
    as.data.frame()
  cor_gene <- cor_matrix[[target_gene]]
  
  names(cor_gene) <- rownames(cor_matrix)
  return(cor_gene)
}

plot_gene_expression <- function(tissue_expression, gene_list) {
  tissue_expression_long <- tissue_expression %>%
    filter(Gene %in% gene_list) %>%
    pivot_longer(cols = -Gene, names_to = "Sample", values_to = "Expression")

  ggplot(tissue_expression_long, aes(x = Sample, y = Expression, color = Gene, group = Gene)) +
    geom_point() +
    geom_line() +
    theme_bw()
}

##### Set up parameters for the analysis ----

tissue_files <- c(Adipose = "Adipose.csv",
                  Liver = "Liver.csv",
                  Muscle = "Muscle.csv")

##### Run the reusable workflow ----

expression_by_tissue <- list()
for (tissue_name in names(tissue_files)) {
  expression_by_tissue[[tissue_name]] <- read.csv(file.path(data_dir, tissue_files[tissue_name]))
}

target_gene_correlations <- sapply(expression_by_tissue, function(tissue_expression) {
    extract_target_correlations(tissue_expression, target_gene)
  }) %>%
  as.data.frame() %>%
  tibble::rownames_to_column("Gene") %>%
  filter(Gene != target_gene)

shared_highly_correlated_genes <- target_gene_correlations %>%
  filter(if_all(-Gene, ~ .x > correlation_threshold))

# Export CSV
write.csv(
  shared_highly_correlated_genes,
  file.path(output_dir, "shared_highly_correlated_genes.csv"),
  row.names = FALSE
)

per_tissue_plots <- list()
selected_genes <- c(shared_highly_correlated_genes$Gene, target_gene)

for (tissue_name in names(tissue_files)) {
  tissue_expression <- expression_by_tissue[[tissue_name]]
  per_tissue_plots[[tissue_name]] <- plot_gene_expression(tissue_expression, selected_genes) +
    labs(title = paste("Expression of Highly Correlated Genes in", tissue_name))
}

# Export plots to a single PDF
pdf(file.path(output_dir, "per_tissue_expression_plots.pdf"))
for (tissue_name in names(per_tissue_plots)) {
  print(per_tissue_plots[[tissue_name]])
}
dev.off()