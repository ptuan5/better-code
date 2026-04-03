plants <- data.frame(
  treatment = c("control", "control", "fertilizer", "fertilizer", "shade", "shade"),
  height_cm = c(12.1, 11.8, 15.2, 14.9, 10.5, 10.8)
)

control_values <- plants$height_cm[plants$treatment == "control"]
control_mean <- mean(control_values)
control_sd <- sd(control_values)
control_summary <- paste("control mean =", round(control_mean, 2), "sd =", round(control_sd, 2))

fertilizer_values <- plants$height_cm[plants$treatment == "fertilizer"]
fertilizer_mean <- mean(fertilizer_values)
fertilizer_sd <- sd(fertilizer_values)
fertilizer_summary <- paste("fertilizer mean =", round(fertilizer_mean, 2), "sd =", round(fertilizer_sd, 2))

shade_values <- plants$height_cm[plants$treatment == "shade"]
shade_mean <- mean(shade_values)
shade_sd <- sd(shade_values)
shade_summary <- paste("shade mean =", round(shade_mean, 2), "sd =", round(shade_sd, 2))

print(control_summary)
print(fertilizer_summary)
print(shade_summary)
