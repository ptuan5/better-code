library(tidyr)
library(tibble)
library(ggplot2)

# Refactored example for the repeated per-tissue correlation workflow.
# This version keeps the same analysis but makes the target gene and
# correlation threshold easy to change at the top of the script.

##### Helper functions for the workflow ----
extract_target_correlations <- function(expression_data, target_gene) {
  # Extract one tissue's correlations with the selected target gene.
  expression_matrix <- expression_data %>%
    tibble::column_to_rownames("Gene")
  
  cor_matrix <- cor(t(expression_matrix)) %>%
    as.data.frame()
  cor_gene <- cor_matrix[[target_gene]]
  
  names(cor_gene) <- rownames(cor_matrix)
  return(cor_gene)
}

plot_gene_expression <- function(tissue_expression, gene_list) {
  # Plot the expression of selected genes across tissues.
  tissue_expression_long <- tissue_expression %>%
    filter(Gene %in% gene_list) %>%
    pivot_longer(cols = -Gene, names_to = "Sample", values_to = "Expression")

  ggplot(tissue_expression_long, aes(x = Sample, y = Expression, color = Gene, group = Gene)) +
    geom_point() +
    geom_line() +
    theme_bw()
}

##### Set up parameters for the analysis ----

data_dir <- "mock_data_3_tissues"
tissue_files <- c(Adipose = "Adipose.csv",
                  Liver = "Liver.csv",
                  Muscle = "Muscle.csv")

target_gene <- "LIF"
correlation_threshold <- 0.5

##### Run the reusable workflow ----

# Read in the data file for each tissue.
expression_by_tissue <- list()
for (tissue_name in names(tissue_files)) {
  expression_by_tissue[[tissue_name]] <- read.csv(file.path(data_dir, tissue_files[tissue_name]))
}

# Apply the correlation extraction function to each tissue's expression data
target_gene_correlations <- sapply(expression_by_tissue, function(tissue_expression) {
    extract_target_correlations(tissue_expression, target_gene)
  }) %>%
  as.data.frame() %>%
  tibble::rownames_to_column("Gene") %>%
  filter(Gene != target_gene) # Remove the target gene itself from the correlation

# Find genes that are highly correlated with LIF in all tissues
shared_highly_correlated_genes <- target_gene_correlations %>%
  filter(if_all(-Gene, ~ .x > correlation_threshold))
print(shared_highly_correlated_genes)

# Plot the expression of the shared highly correlated genes across tissues
per_tissue_plots <- list()
selected_genes <- c(shared_highly_correlated_genes$Gene, target_gene)

for (tissue_name in names(tissue_files)) {
  tissue_expression <- expression_by_tissue[[tissue_name]]
  per_tissue_plots[[tissue_name]] <- plot_gene_expression(tissue_expression, selected_genes) +
    labs(title = paste("Expression of Highly Correlated Genes in", tissue_name))
}
