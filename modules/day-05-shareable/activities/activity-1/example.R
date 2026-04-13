# Example analysis script for a tiny experiment.
# Inputs: numeric measurement values defined in this script.
# Outputs:
#   1. A summary table written to results/measurement_summary-R.csv
#   2. The mean measurement printed to the console

calculate_mean_measurement <- function(values) {
  mean(values)
}

build_summary_table <- function(values) {
  data.frame(
    measurement = values,
    deviation_from_mean = values - mean(values)
  )
}

write_summary_table <- function(summary_table, output_file) {
  output_dir <- dirname(output_file)

  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
  }

  write.csv(summary_table, output_file, row.names = FALSE)
}

run_analysis <- function(output_file = "results/measurement_summary-R.csv") {
  measurements <- c(4.2, 4.8, 5.1, 5.0)
  mean_measurement <- calculate_mean_measurement(measurements)
  summary_table <- build_summary_table(measurements)

  write_summary_table(summary_table, output_file)

  cat("Mean measurement:", mean_measurement, "\n")
  cat("Wrote summary table to:", output_file, "\n")
}

run_analysis()
