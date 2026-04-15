#!/usr/bin/env Rscript

# ------------------------------------------------------------------------------
# Description:
#   Command-line tool to generate stacked bar plots of gene set uploads over time.
#
#   This script:
#     - Reads a CSV file containing gene set metadata
#     - Filters data by a specified year range
#     - Computes yearly and cumulative counts by experimental model
#     - Infers drug category (Opioid, Cocaine, Alcohol) from the data
#     - Generates stacked bar plots
#     - Saves the plots to a multi-page PDF
#
# Usage:
#   Rscript script.R --path <dir> --file <file.csv> --output <out.pdf>
#
# Notes:
#   - Expected columns in the input CSV: 'search_text', 'created', 'model'
#   - The 'created' column should be in MM/DD/YYYY format
#   - The script filters data between a start and end year
#   - Output is a multi-page PDF containing:
#       1) Cumulative counts by model
#       2) Yearly counts by model
# ------------------------------------------------------------------------------

suppressMessages(
  suppressWarnings({
    library(ggplot2)
    library(dplyr)
    library(lubridate)
    library(tidyr)
    library(data.table)
    library(viridis)
    library(optparse)
  })
)

##### Argument parsing with optparse ---
option_list <- list(
  make_option("--path", type = "character", help = "Directory containing the input CSV file [required]"),
  make_option("--file", type = "character", help = "Input CSV filename [required]"),
  make_option("--output", type = "character", help = "Path to the output PDF file [required]"),
  make_option("--start_year", type = "integer", default = 2015, help = "Start year for the plot range [default %default]"),
  make_option("--end_year", type = "integer", default = 2025, help = "End year for the plot range [default %default]")
)

parser <- OptionParser(
  option_list = option_list,
  description = "Run the starter plotting workflow from the command line."
)

opt <- parse_args(parser)

path <- opt$path
file <- opt$file
output <- opt$output
start_year <- opt$start_year
end_year <- opt$end_year

# Validate inputs
if (is.null(path) || is.null(file) || is.null(output)) {
  cat("Error: --path, --file, and --output are required.\n\n")
  print_help(parser)
  quit(status = 1)
}

if (end_year < start_year) {
  stop("--end_year must be greater than or equal to --start_year.", call. = FALSE)
}

dir.create(dirname(output), recursive = TRUE, showWarnings = FALSE)

# Main analysis
create_plots <- function(path, file, start_year, end_year) {
  original_wd <- getwd()
  on.exit(setwd(original_wd), add = TRUE)
  setwd(path)

  readfile <- fread(file)
  allyears <- data.frame(readfile)

  allyears <- allyears %>%
    mutate(drug = case_when(
      any("opioid" %in% search_text) ~ "Opioid",
      any("cocaine" %in% search_text) ~ "Cocaine",
      any("alcohol" %in% search_text) ~ "Alcohol",
      TRUE ~ "Unknown"
    ))

  drug <- allyears[1, "drug"]

  allyears$created <- as.Date(allyears$created, format = "%m/%d/%Y")
  allyears <- allyears %>% mutate(created = format(created, "%Y"))

  recentyears <- allyears[allyears$created >= start_year, ]
  recentyears <- recentyears[grepl("^NA", rownames(recentyears)) == FALSE, ]

  model_recent <- unique(recentyears$model)
  years <- data.frame(year = start_year:end_year)$year

  cumulative_data <- recentyears %>%
    count(created, model) %>%
    arrange(created) %>%
    group_by(created, model)

  all_grid <- expand_grid(
    model = model_recent,
    created = as.character(years)
  )

  counts_complete <- all_grid %>%
    left_join(cumulative_data, by = c("created", "model")) %>%
    mutate(n = dplyr::coalesce(n, 0L))

  df_cumulative <- counts_complete %>%
    group_by(model) %>%
    arrange(created) %>%
    mutate(Cumulative_Count = cumsum(n))

  cum_title <- paste(
    "Cumulative Number of",
    drug,
    "Genesets Uploaded by Experimental Model:",
    start_year,
    "-",
    end_year
  )

  cum_count_model <- ggplot(df_cumulative, aes(x = created, y = Cumulative_Count, fill = model)) +
    geom_col(color = "white", linewidth = 0.05) +
    scale_fill_viridis_d(option = "plasma") +
    labs(title = cum_title, x = "Year", y = "Cumulative Count", fill = "Experimental Model") +
    theme(plot.title = element_text(hjust = 0.5))

  count_title <- paste(
    "Number of",
    drug,
    "Genesets Uploaded by Experimental Model:",
    start_year,
    "-",
    end_year
  )

  count_model <- ggplot(df_cumulative, aes(x = created, y = n, fill = model)) +
    geom_col(color = "white", linewidth = 0.05) +
    scale_fill_viridis_d(option = "plasma") +
    labs(title = count_title, x = "Year", y = "Count", fill = "Experimental Model") +
    theme(plot.title = element_text(hjust = 0.5))

  list(cum_count_model, count_model)
}

plot_list <- create_plots(path, file, start_year, end_year)

# Save plots to PDF
pdf(output, width = 10, height = 6)
for (plot_object in plot_list) {
  print(plot_object)
}
dev.off()
