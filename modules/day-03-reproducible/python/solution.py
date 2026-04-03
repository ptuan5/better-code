measurements = [
    {"sample_id": "S1", "condition": "control", "signal": 5.2},
    {"sample_id": "S2", "condition": "control", "signal": 5.5},
    {"sample_id": "S3", "condition": "treated", "signal": 6.8},
    {"sample_id": "S4", "condition": "treated", "signal": 7.1},
]


def mean_signal(rows, condition_name):
    values = [row["signal"] for row in rows if row["condition"] == condition_name]
    return sum(values) / len(values)


def run_analysis(rows):
    treated_mean = mean_signal(rows, "treated")
    control_mean = mean_signal(rows, "control")
    return {
        "treated_mean": treated_mean,
        "control_mean": control_mean,
        "mean_difference": treated_mean - control_mean,
    }


if __name__ == "__main__":
    result = run_analysis(measurements)
    print("Required packages: standard library only")
    print("Inputs: a list of records with sample_id, condition, and signal")
    print("Output: difference in mean signal between treated and control")
    print("Mean difference:", result["mean_difference"])
