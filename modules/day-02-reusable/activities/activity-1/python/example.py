plants = [
    {"treatment": "control", "height_cm": 12.1, "leaf_count": 8},
    {"treatment": "control", "height_cm": 11.8, "leaf_count": 9},
    {"treatment": "fertilizer", "height_cm": 15.2, "leaf_count": 14},
    {"treatment": "fertilizer", "height_cm": 14.9, "leaf_count": 13},
    {"treatment": "shade", "height_cm": 10.5, "leaf_count": 6},
    {"treatment": "shade", "height_cm": 10.8, "leaf_count": 7},
]


def summarize_treatment_metric(rows, treatment_name, value_key):
    values = [row[value_key] for row in rows if row["treatment"] == treatment_name]
    return {
        "treatment": treatment_name,
        "average_value": sum(values) / len(values),
        "sample_size": len(values),
    }


def format_summary(summary_result, metric_label, unit=""):
    unit_text = f" {unit}" if unit else ""
    return (
        f'{summary_result["treatment"]} {metric_label} = '
        f'{summary_result["average_value"]:.1f}{unit_text} '
        f'(n = {summary_result["sample_size"]})'
    )


metric_specs = [
    {"key": "height_cm", "label": "average height", "unit": "cm", "heading": "Height summaries"},
    {"key": "leaf_count", "label": "average leaves", "unit": "", "heading": "Leaf summaries"},
]

for metric in metric_specs:
    print(metric["heading"])
    for treatment_name in sorted({row["treatment"] for row in plants}):
        summary = summarize_treatment_metric(plants, treatment_name, metric["key"])
        print(format_summary(summary, metric["label"], metric["unit"]))
