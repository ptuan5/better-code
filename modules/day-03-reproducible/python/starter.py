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

print(treated["signal"].mean() - control["signal"].mean())
