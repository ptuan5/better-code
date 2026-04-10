import pandas as pd

measurements = pd.DataFrame(
    {
        "sample_id": ["S1", "S2", "S3", "S4"],
        "condition": ["control", "control", "treated", "treated"],
        "signal": [5.2, 5.5, 6.8, 7.1],
    }
)

treated = measurements[measurements["condition"] == "treated"]
control = measurements[measurements["condition"] == "control"]
mean_difference = treated["signal"].mean() - control["signal"].mean()

summary_table = pd.DataFrame(
    {"metric": ["treated_minus_control"], "value": [mean_difference]}
)

summary_table.to_csv("signal_difference.csv", index=False)
print(mean_difference)
