library(dplyr)

gene_set_uploads <- data.frame(
  created = c("01/10/2021", "03/15/2021", "07/02/2022", "04/21/2022", "08/08/2023", "09/14/2023"),
  model = c("mouse", "cell line", "mouse", "human", "human", "mouse"),
  search_text = c("opioid", "opioid", "opioid", "opioid", "opioid", "opioid")
)

summarize_model_counts <- function(data, start_year = "2021", end_year = "2023") {
  prepared <- data
  prepared$created <- as.Date(prepared$created, format = "%m/%d/%Y")
  prepared$year <- format(prepared$created, "%Y")

  filtered <- prepared[prepared$year >= start_year & prepared$year <= end_year, ]

  filtered %>%
    count(year, model) %>%
    arrange(year, model)
}

write_results <- function(result_table, output_file = "results/model_counts.csv") {
  output_dir <- dirname(output_file)

  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
  }

  write.csv(result_table, output_file, row.names = FALSE)
}

main <- function() {
  result_table <- summarize_model_counts(gene_set_uploads)
  output_file <- "results/model_counts.csv"
  write_results(result_table, output_file)
  cat("Saved results to", output_file, "\n")
}

if (sys.nframe() == 0) {
  main()
}
