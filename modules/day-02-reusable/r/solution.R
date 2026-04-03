plants <- data.frame(
  treatment = c("control", "control", "fertilizer", "fertilizer", "shade", "shade"),
  height_cm = c(12.1, 11.8, 15.2, 14.9, 10.5, 10.8)
)

summarize_treatment <- function(data, treatment_name) {
  treatment_values <- data$height_cm[data$treatment == treatment_name]

  list(
    treatment = treatment_name,
    mean_height = mean(treatment_values),
    sd_height = sd(treatment_values)
  )
}

format_summary <- function(summary_result) {
  paste(
    summary_result$treatment,
    "mean =",
    round(summary_result$mean_height, 2),
    "sd =",
    round(summary_result$sd_height, 2)
  )
}

for (treatment_name in unique(plants$treatment)) {
  summary_result <- summarize_treatment(plants, treatment_name)
  print(format_summary(summary_result))
}
