measurements <- data.frame(
  sample_id = c("S1", "S2", "S3", "S4"),
  condition = c("control", "control", "treated", "treated"),
  signal = c(5.2, 5.5, 6.8, 7.1)
)

summarize_condition <- function(data, condition_name) {
  mean(data$signal[data$condition == condition_name])
}

run_analysis <- function(input_data) {
  treated_mean <- summarize_condition(input_data, "treated")
  control_mean <- summarize_condition(input_data, "control")

  list(
    treated_mean = treated_mean,
    control_mean = control_mean,
    mean_difference = treated_mean - control_mean
  )
}

analysis_result <- run_analysis(measurements)

cat("Required packages: base R only\n")
cat("Inputs: a data frame with sample_id, condition, and signal columns\n")
cat("Output: difference in mean signal between treated and control samples\n")
cat("Mean difference:", analysis_result$mean_difference, "\n")
