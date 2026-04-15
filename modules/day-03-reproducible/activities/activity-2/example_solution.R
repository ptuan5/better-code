# Executable version of starter.R that accepts the same plotting arguments plus
# an output PDF path.

suppressPackageStartupMessages({
  library(ggplot2)
  library(dplyr)
  library(lubridate)
  library(tidyr)
  library(data.table)
  library(optparse)
  library(viridis)
})

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

  years_df <- data.frame(year = start_year:end_year)
  years <- years_df$year

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

build_option_parser <- function() {
  option_list <- list(
    make_option("--path", type = "character", help = "Directory containing the input CSV file."),
    make_option("--file", type = "character", help = "Input CSV filename."),
    make_option("--start-year", dest = "start_year", type = "integer", help = "Start year for the plot range."),
    make_option("--end-year", dest = "end_year", type = "integer", help = "End year for the plot range."),
    make_option("--output", type = "character", help = "Path to the output PDF file.")
  )

  OptionParser(
    usage = "Rscript %prog --path PATH --file FILE --start-year YEAR --end-year YEAR --output FILE",
    description = "Run the starter plotting workflow with command-line arguments.",
    option_list = option_list
  )
}

parse_command_args <- function() {
  parser <- build_option_parser()
  options <- parse_args(parser)

  required_fields <- c("path", "file", "start_year", "end_year", "output")
  missing_fields <- required_fields[
    vapply(
      required_fields,
      function(field_name) {
        value <- options[[field_name]]
        is.null(value) || (length(value) == 1 && is.na(value))
      },
      logical(1)
    )
  ]

  if (length(missing_fields) > 0) {
    print_help(parser)
    stop(
      "Please provide --path, --file, --start-year, --end-year, and --output.",
      call. = FALSE
    )
  }

  if (options$end_year < options$start_year) {
    stop("--end-year must be greater than or equal to --start-year.", call. = FALSE)
  }

  options
}

save_plots_to_pdf <- function(plot_list, output_path) {
  output_dir <- dirname(output_path)
  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
  }

  pdf(output_path, width = 10, height = 6)
  on.exit(dev.off(), add = TRUE)

  for (plot_object in plot_list) {
    print(plot_object)
  }
}

main <- function() {
  options <- parse_command_args()
  input_dir <- normalizePath(options$path, mustWork = TRUE)
  input_file <- options$file
  input_path <- file.path(input_dir, input_file)

  if (!file.exists(input_path)) {
    stop("Input file not found: ", input_path)
  }

  output_path <- normalizePath(options$output, mustWork = FALSE)
  plot_list <- create_plots(input_dir, input_file, options$start_year, options$end_year)
  save_plots_to_pdf(plot_list, output_path)

  cat("Input directory:", input_dir, "\n")
  cat("Input file:", input_file, "\n")
  cat("Start year:", options$start_year, "\n")
  cat("End year:", options$end_year, "\n")
  cat("Saved plots to:", output_path, "\n")
  cat("Done\n")
}

if (sys.nframe() == 0) {
  main()
}
