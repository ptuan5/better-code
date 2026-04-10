library(dplyr)

measurements <- data.frame(
  sample_id = c("S1", "S2", "S3", "S4"),
  condition = c("control", "control", "treated", "treated"),
  signal = c(5.2, 5.5, 6.8, 7.1)
)

treated <- measurements %>% filter(condition == "treated")
control <- measurements %>% filter(condition == "control")

mean_difference <- mean(treated$signal) - mean(control$signal)
summary_table <- data.frame(
  metric = "treated_minus_control",
  value = mean_difference
)

write.csv(summary_table, "signal_difference.csv", row.names = FALSE)
print(mean_difference)
