plants <- data.frame(
  treatment = c("control", "control", "fertilizer", "fertilizer", "shade", "shade"),
  height_cm = c(12.1, 11.8, 15.2, 14.9, 10.5, 10.8),
  leaf_count = c(8, 9, 14, 13, 6, 7)
)

summarize_treatment_metric <- function(data, treatment_name, value_column) {
  treatment_values <- data[[value_column]][data$treatment == treatment_name]

  list(
    treatment = treatment_name,
    average_value = mean(treatment_values),
    sample_size = length(treatment_values)
  )
}

format_summary <- function(summary_result, metric_label, unit = "") {
  sprintf(
    "%s %s = %.1f%s (n = %d)",
    summary_result$treatment,
    metric_label,
    summary_result$average_value,
    ifelse(unit == "", "", paste0(" ", unit)),
    summary_result$sample_size
  )
}

metric_specs <- list(
  list(column = "height_cm", label = "average height", unit = "cm", heading = "Height summaries"),
  list(column = "leaf_count", label = "average leaves", unit = "", heading = "Leaf summaries")
)

for (metric in metric_specs) {
  cat(metric$heading, "\n")

  for (treatment_name in unique(plants$treatment)) {
    summary_result <- summarize_treatment_metric(plants, treatment_name, metric$column)
    cat(format_summary(summary_result, metric$label, metric$unit), "\n")
  }
}
