plants <- data.frame(
  treatment = c("control", "control", "fertilizer", "fertilizer", "shade", "shade"),
  height_cm = c(12.1, 11.8, 15.2, 14.9, 10.5, 10.8),
  leaf_count = c(8, 9, 14, 13, 6, 7)
)

control_height_values <- plants$height_cm[plants$treatment == "control"]
control_height_mean <- mean(control_height_values)
control_height_summary <- paste(
  "control average height =",
  round(control_height_mean, 1),
  "cm"
)

fertilizer_height_values <- plants$height_cm[plants$treatment == "fertilizer"]
fertilizer_height_mean <- mean(fertilizer_height_values)
fertilizer_height_summary <- paste(
  "fertilizer average height =",
  round(fertilizer_height_mean, 1),
  "cm"
)

shade_height_values <- plants$height_cm[plants$treatment == "shade"]
shade_height_mean <- mean(shade_height_values)
shade_height_summary <- paste(
  "shade average height =",
  round(shade_height_mean, 1),
  "cm"
)

control_leaf_values <- plants$leaf_count[plants$treatment == "control"]
control_leaf_mean <- mean(control_leaf_values)
control_leaf_summary <- paste(
  "control average leaves =",
  round(control_leaf_mean, 1)
)

fertilizer_leaf_values <- plants$leaf_count[plants$treatment == "fertilizer"]
fertilizer_leaf_mean <- mean(fertilizer_leaf_values)
fertilizer_leaf_summary <- paste(
  "fertilizer average leaves =",
  round(fertilizer_leaf_mean, 1)
)

shade_leaf_values <- plants$leaf_count[plants$treatment == "shade"]
shade_leaf_mean <- mean(shade_leaf_values)
shade_leaf_summary <- paste(
  "shade average leaves =",
  round(shade_leaf_mean, 1)
)

print("Height summaries")
print(control_height_summary)
print(fertilizer_height_summary)
print(shade_height_summary)

print("Leaf summaries")
print(control_leaf_summary)
print(fertilizer_leaf_summary)
print(shade_leaf_summary)
