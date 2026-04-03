plants = [
    {"treatment": "control", "height_cm": 12.1},
    {"treatment": "control", "height_cm": 11.8},
    {"treatment": "fertilizer", "height_cm": 15.2},
    {"treatment": "fertilizer", "height_cm": 14.9},
    {"treatment": "shade", "height_cm": 10.5},
    {"treatment": "shade", "height_cm": 10.8},
]

control_values = [row["height_cm"] for row in plants if row["treatment"] == "control"]
control_mean = sum(control_values) / len(control_values)
control_summary = f"control mean = {control_mean:.2f}"

fertilizer_values = [row["height_cm"] for row in plants if row["treatment"] == "fertilizer"]
fertilizer_mean = sum(fertilizer_values) / len(fertilizer_values)
fertilizer_summary = f"fertilizer mean = {fertilizer_mean:.2f}"

shade_values = [row["height_cm"] for row in plants if row["treatment"] == "shade"]
shade_mean = sum(shade_values) / len(shade_values)
shade_summary = f"shade mean = {shade_mean:.2f}"

print(control_summary)
print(fertilizer_summary)
print(shade_summary)
