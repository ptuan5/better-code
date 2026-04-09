plants = [
    {"treatment": "control", "height_cm": 12.1, "leaf_count": 8},
    {"treatment": "control", "height_cm": 11.8, "leaf_count": 9},
    {"treatment": "fertilizer", "height_cm": 15.2, "leaf_count": 14},
    {"treatment": "fertilizer", "height_cm": 14.9, "leaf_count": 13},
    {"treatment": "shade", "height_cm": 10.5, "leaf_count": 6},
    {"treatment": "shade", "height_cm": 10.8, "leaf_count": 7},
]

control_height_values = [
    row["height_cm"] for row in plants if row["treatment"] == "control"
]
control_height_mean = sum(control_height_values) / len(control_height_values)
control_height_summary = f"control average height = {control_height_mean:.1f} cm"

fertilizer_height_values = [
    row["height_cm"] for row in plants if row["treatment"] == "fertilizer"
]
fertilizer_height_mean = sum(fertilizer_height_values) / len(fertilizer_height_values)
fertilizer_height_summary = f"fertilizer average height = {fertilizer_height_mean:.1f} cm"

shade_height_values = [row["height_cm"] for row in plants if row["treatment"] == "shade"]
shade_height_mean = sum(shade_height_values) / len(shade_height_values)
shade_height_summary = f"shade average height = {shade_height_mean:.1f} cm"

control_leaf_values = [row["leaf_count"] for row in plants if row["treatment"] == "control"]
control_leaf_mean = sum(control_leaf_values) / len(control_leaf_values)
control_leaf_summary = f"control average leaves = {control_leaf_mean:.1f}"

fertilizer_leaf_values = [
    row["leaf_count"] for row in plants if row["treatment"] == "fertilizer"
]
fertilizer_leaf_mean = sum(fertilizer_leaf_values) / len(fertilizer_leaf_values)
fertilizer_leaf_summary = f"fertilizer average leaves = {fertilizer_leaf_mean:.1f}"

shade_leaf_values = [row["leaf_count"] for row in plants if row["treatment"] == "shade"]
shade_leaf_mean = sum(shade_leaf_values) / len(shade_leaf_values)
shade_leaf_summary = f"shade average leaves = {shade_leaf_mean:.1f}"

print("Height summaries")
print(control_height_summary)
print(fertilizer_height_summary)
print(shade_height_summary)

print("Leaf summaries")
print(control_leaf_summary)
print(fertilizer_leaf_summary)
print(shade_leaf_summary)
