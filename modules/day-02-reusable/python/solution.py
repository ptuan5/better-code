plants = [
    {"treatment": "control", "height_cm": 12.1},
    {"treatment": "control", "height_cm": 11.8},
    {"treatment": "fertilizer", "height_cm": 15.2},
    {"treatment": "fertilizer", "height_cm": 14.9},
    {"treatment": "shade", "height_cm": 10.5},
    {"treatment": "shade", "height_cm": 10.8},
]


def summarize_treatment(rows, treatment_name):
    values = [row["height_cm"] for row in rows if row["treatment"] == treatment_name]
    return {
        "treatment": treatment_name,
        "mean_height": sum(values) / len(values),
        "sample_size": len(values),
    }


def format_summary(summary_result):
    return (
        f'{summary_result["treatment"]} mean = '
        f'{summary_result["mean_height"]:.2f} '
        f'(n = {summary_result["sample_size"]})'
    )


for treatment_name in sorted({row["treatment"] for row in plants}):
    summary = summarize_treatment(plants, treatment_name)
    print(format_summary(summary))
