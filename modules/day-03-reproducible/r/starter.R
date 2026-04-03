library(dplyr)

setwd("~/Desktop/project")

measurements <- data.frame(
  sample_id = c("S1", "S2", "S3", "S4"),
  condition = c("control", "control", "treated", "treated"),
  signal = c(5.2, 5.5, 6.8, 7.1)
)

treated_mean <- measurements %>%
  filter(condition == "treated") %>%
  summarize(mean_signal = mean(signal))

control_mean <- measurements %>%
  filter(condition == "control") %>%
  summarize(mean_signal = mean(signal))

print(treated_mean$mean_signal - control_mean$mean_signal)
