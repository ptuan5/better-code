# Analyze treated and control measurements and write a summary file.
# Package requirement: dplyr
# Output: results/signal_difference.csv

library(dplyr)

measurements <- data.frame(
  sample_id = c("S1", "S2", "S3", "S4"),
  condition = c("control", "control", "treated", "treated"),
  signal = c(5.2, 5.5, 6.8, 7.1)
)

calculate_mean_difference <- function(data) {
  treated_mean <- mean(data$signal[data$condition == "treated"])
  control_mean <- mean(data$signal[data$condition == "control"])
  treated_mean - control_mean
}

write_results <- function(result_table, output_file) {
  output_dir <- dirname(output_file)

  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
  }

  write.csv(result_table, output_file, row.names = FALSE)
}

run_analysis <- function(input_data, output_file = "results/signal_difference.csv") {
  mean_difference <- calculate_mean_difference(input_data)
  result_table <- data.frame(
    metric = "treated_minus_control",
    value = mean_difference
  )

  write_results(result_table, output_file)

  list(
    output_file = output_file,
    result_table = result_table
  )
}

if (sys.nframe() == 0) {
  analysis_result <- run_analysis(measurements)

  cat("Required packages: dplyr\n")
  cat("Inputs: a data frame with sample_id, condition, and signal columns\n")
  cat("Output file:", analysis_result$output_file, "\n")
  cat("Mean difference:", analysis_result$result_table$value, "\n")
}
