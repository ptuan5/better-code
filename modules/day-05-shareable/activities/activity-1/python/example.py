"""Tiny analysis example with a clear entry point and output description."""

import csv
from pathlib import Path


def calculate_mean_measurement(values):
    return sum(values) / len(values)


def build_summary_rows(values):
    mean_value = calculate_mean_measurement(values)
    return [
        {"measurement": value, "deviation_from_mean": value - mean_value}
        for value in values
    ]


def write_summary_rows(summary_rows, output_file):
    output_path = Path(output_file)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    with output_path.open("w", newline="") as handle:
        writer = csv.DictWriter(
            handle, fieldnames=["measurement", "deviation_from_mean"]
        )
        writer.writeheader()
        writer.writerows(summary_rows)


def run_analysis(output_file="results/measurement_summary.csv"):
    measurements = [4.2, 4.8, 5.1, 5.0]
    mean_measurement = calculate_mean_measurement(measurements)
    summary_rows = build_summary_rows(measurements)
    write_summary_rows(summary_rows, output_file)
    print("Mean measurement:", mean_measurement)
    print("Wrote summary table to:", output_file)


if __name__ == "__main__":
    run_analysis()
