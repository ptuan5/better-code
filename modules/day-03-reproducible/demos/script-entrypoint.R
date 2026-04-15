# Demo script for Day 3: turn the Day 2 correlation workflow into an executable script.

suppressPackageStartupMessages({
  library(dplyr)
  library(tidyr)
  library(tibble)
  library(ggplot2)
})

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

print_usage <- function(default_data_dir, default_output_dir) {
  cat(
    paste(
      "Usage: Rscript script-entrypoint.R [options]",
      "",
      "Options:",
      "  --data-dir PATH                 Directory with Adipose.csv, Liver.csv, and Muscle.csv",
      "  --target-gene GENE             Target gene to compare (default: LIF)",
      "  --correlation-threshold NUM    Minimum correlation threshold (default: 0.5)",
      "  --correlation-method NAME      Correlation method for cor() (default: pearson)",
      "  --output-dir PATH              Directory for CSV and PDF outputs",
      "  --help                        Show this message",
      "",
      paste("Defaults:"),
      paste("  data-dir:", default_data_dir),
      paste("  output-dir:", default_output_dir),
      sep = "\n"
    )
  )
}

parse_command_args <- function(args, defaults) {
  options <- defaults
  index <- 1

  while (index <= length(args)) {
    current_arg <- args[[index]]

    if (current_arg %in% c("-h", "--help")) {
      print_usage(defaults$data_dir, defaults$output_dir)
      return(NULL)
    }

    if (!grepl("^--", current_arg)) {
      stop("Unexpected argument: ", current_arg)
    }

    if (grepl("=", current_arg, fixed = TRUE)) {
      pieces <- strsplit(sub("^--", "", current_arg), "=", fixed = TRUE)[[1]]
      option_name <- gsub("-", "_", pieces[[1]])
      option_value <- pieces[[2]]
      index <- index + 1
    } else {
      option_name <- gsub("-", "_", sub("^--", "", current_arg))
      if (index == length(args)) {
        stop("Missing value for --", gsub("_", "-", option_name))
      }
      option_value <- args[[index + 1]]
      index <- index + 2
    }

    if (!option_name %in% names(options)) {
      stop("Unknown option: --", gsub("_", "-", option_name))
    }

    options[[option_name]] <- option_value
  }

  options$correlation_threshold <- as.numeric(options$correlation_threshold)
  if (is.na(options$correlation_threshold)) {
    stop("--correlation-threshold must be numeric.")
  }

  options
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
  defaults <- list(
    data_dir = normalizePath(
      file.path(script_dir, "../../day-02-reusable/activities/activity-1/mock_data_3_tissues"),
      mustWork = FALSE
    ),
    target_gene = "LIF",
    correlation_threshold = 0.5,
    correlation_method = "pearson",
    output_dir = normalizePath(file.path(script_dir, "results"), mustWork = FALSE)
  )
  options <- parse_command_args(commandArgs(trailingOnly = TRUE), defaults)
  if (is.null(options)) {
    return(invisible(NULL))
  }

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
