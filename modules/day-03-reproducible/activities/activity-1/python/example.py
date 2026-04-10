from pathlib import Path

import pandas as pd

measurements = pd.DataFrame(
    {
        "sample_id": ["S1", "S2", "S3", "S4"],
        "condition": ["control", "control", "treated", "treated"],
        "signal": [5.2, 5.5, 6.8, 7.1],
    }
)


def calculate_mean_difference(data):
    treated = data[data["condition"] == "treated"]
    control = data[data["condition"] == "control"]
    return treated["signal"].mean() - control["signal"].mean()


def write_results(result_table, output_file):
    output_path = Path(output_file)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    result_table.to_csv(output_path, index=False)


def run_analysis(data, output_file="results/signal_difference.csv"):
    mean_difference = calculate_mean_difference(data)
    result_table = pd.DataFrame(
        {"metric": ["treated_minus_control"], "value": [mean_difference]}
    )
    write_results(result_table, output_file)
    return {"output_file": output_file, "result_table": result_table}


if __name__ == "__main__":
    result = run_analysis(measurements)
    print("Required packages: pandas")
    print("Inputs: a table with sample_id, condition, and signal columns")
    print("Output file:", result["output_file"])
    print("Mean difference:", result["result_table"]["value"].iloc[0])
