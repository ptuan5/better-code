# Example analysis script for a tiny experiment.
# Inputs: numeric measurement values defined in this script.
# Output: the mean measurement, printed to the console.

calculate_mean_measurement <- function(values) {
  mean(values)
}

run_analysis <- function() {
  measurements <- c(4.2, 4.8, 5.1, 5.0)
  mean_measurement <- calculate_mean_measurement(measurements)
  cat("Mean measurement:", mean_measurement, "\n")
}

run_analysis()
