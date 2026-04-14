# Demo script for Day 3: turn the Day 2 correlation workflow into an executable script.

suppressPackageStartupMessages({
  library(dplyr)
  library(tidyr)
  library(tibble)
  library(ggplot2)
})

if (!requireNamespace("optparse", quietly = TRUE)) {
  stop("Please install the 'optparse' package to run this script with command-line flags.")
}

extract_target_correlations <- function(expression_data, target_gene, correlation_method = "pearson") {
  expression_matrix <- expression_data %>%
    tibble::column_to_rownames("Gene")

  cor_matrix <- cor(t(expression_matrix), method = correlation_method) %>%
    as.data.frame()
  cor_gene <- cor_matrix[[target_gene]]

  names(cor_gene) <- rownames(cor_matrix)
  cor_gene
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

get_script_dir <- function() {
  file_arg <- "--file="
  script_path <- sub(file_arg, "", commandArgs(trailingOnly = FALSE)[grep(file_arg, commandArgs(trailingOnly = FALSE))])
  dirname(normalizePath(script_path))
}

run_analysis <- function(data_dir,
                         target_gene,
                         correlation_threshold,
                         correlation_method,
                         output_dir) {
  tissue_files <- c(
    Adipose = "Adipose.csv",
    Liver = "Liver.csv",
    Muscle = "Muscle.csv"
  )

  dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

  expression_by_tissue <- list()
  for (tissue_name in names(tissue_files)) {
    expression_by_tissue[[tissue_name]] <- read.csv(
      file.path(data_dir, tissue_files[[tissue_name]])
    )
  }

  target_gene_correlations <- sapply(
    expression_by_tissue,
    function(tissue_expression) {
      extract_target_correlations(tissue_expression, target_gene, correlation_method)
    }
  ) %>%
    as.data.frame() %>%
    tibble::rownames_to_column("Gene") %>%
    filter(Gene != target_gene)

  shared_highly_correlated_genes <- target_gene_correlations %>%
    filter(if_all(-Gene, ~ .x > correlation_threshold))

  results_path <- file.path(output_dir, "shared_highly_correlated_genes.csv")
  write.csv(shared_highly_correlated_genes, results_path, row.names = FALSE)

  plot_path <- file.path(output_dir, "shared_gene_expression.pdf")
  selected_genes <- c(shared_highly_correlated_genes$Gene, target_gene)
  per_tissue_plots <- list()

  pdf(plot_path, width = 8, height = 5)
  for (tissue_name in names(tissue_files)) {
    tissue_expression <- expression_by_tissue[[tissue_name]]
    per_tissue_plots[[tissue_name]] <- plot_gene_expression(tissue_expression, selected_genes) +
      labs(title = paste("Expression of Highly Correlated Genes in", tissue_name))
    print(per_tissue_plots[[tissue_name]])
  }
  dev.off()

  list(
    shared_highly_correlated_genes = shared_highly_correlated_genes,
    results_path = results_path,
    plot_path = plot_path
  )
}

main <- function() {
  script_dir <- get_script_dir()
  default_data_dir <- normalizePath(
    file.path(script_dir, "../../day-02-reusable/activities/activity-1/mock_data_3_tissues"),
    mustWork = FALSE
  )
  default_output_dir <- normalizePath(file.path(script_dir, "results"), mustWork = FALSE)

  option_list <- list(
    optparse::make_option("--data-dir", type = "character", default = default_data_dir, dest = "data_dir"),
    optparse::make_option("--target-gene", type = "character", default = "LIF", dest = "target_gene"),
    optparse::make_option("--correlation-threshold", type = "double", default = 0.5, dest = "correlation_threshold"),
    optparse::make_option("--correlation-method", type = "character", default = "pearson", dest = "correlation_method"),
    optparse::make_option("--output-dir", type = "character", default = default_output_dir, dest = "output_dir")
  )

  parser <- optparse::OptionParser(option_list = option_list)
  options <- optparse::parse_args(parser)

  analysis_results <- run_analysis(
    data_dir = options$data_dir,
    target_gene = options$target_gene,
    correlation_threshold = options$correlation_threshold,
    correlation_method = options$correlation_method,
    output_dir = options$output_dir
  )

  cat("Target gene:", options$target_gene, "\n")
  cat("Correlation threshold:", options$correlation_threshold, "\n")
  cat("Correlation method:", options$correlation_method, "\n")
  cat("Saved shared genes to:", analysis_results$results_path, "\n")
  cat("Saved plots to:", analysis_results$plot_path, "\n")
  cat("Done\n")
}

if (sys.nframe() == 0) {
  main()
}
