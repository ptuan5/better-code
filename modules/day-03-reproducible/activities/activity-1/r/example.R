# Summarize yearly gene set uploads by model and write the result to disk.
# Package requirement: dplyr
# Output: results/model_counts.csv

library(dplyr)

gene_set_uploads <- data.frame(
  created = c("01/10/2021", "03/15/2021", "07/02/2022", "04/21/2022", "08/08/2023", "09/14/2023"),
  model = c("mouse", "cell line", "mouse", "human", "human", "mouse"),
  search_text = c("opioid", "opioid", "opioid", "opioid", "opioid", "opioid")
)

summarize_model_counts <- function(data, start_year, end_year) {
  data$created <- as.Date(data$created, format = "%m/%d/%Y")
  data$year <- format(data$created, "%Y")

  filtered_data <- data[data$year >= start_year & data$year <= end_year, ]
  filtered_data %>%
    count(year, model) %>%
    arrange(year, model)
}

write_results <- function(result_table, output_file) {
  output_dir <- dirname(output_file)

  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
  }

  write.csv(result_table, output_file, row.names = FALSE)
}

run_analysis <- function(input_data, start_year = "2021", end_year = "2023", output_file = "results/model_counts.csv") {
  result_table <- summarize_model_counts(input_data, start_year, end_year)
  write_results(result_table, output_file)

  list(
    output_file = output_file,
    result_table = result_table
  )
}

if (sys.nframe() == 0) {
  analysis_result <- run_analysis(gene_set_uploads)

  cat("Required packages: dplyr\n")
  cat("Inputs: a data frame with created date, model, and search_text columns\n")
  cat("Output file:", analysis_result$output_file, "\n")
  print(analysis_result$result_table)
}
