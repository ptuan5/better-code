"""Day 4 demo helpers for the silent-break examples."""

from __future__ import annotations

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns


def _get_time_columns(data: pd.DataFrame) -> list[str]:
    """Identify, sort, and validate evenly spaced time columns."""
    time_cols = [column for column in data.columns if str(column).isdigit()]
    time_cols = sorted(time_cols, key=lambda column: int(column))

    timepoints = [int(column) for column in time_cols]
    if len(timepoints) > 1:
        diffs = np.diff(timepoints)
        if not np.all(diffs == diffs[0]):
            raise AssertionError("Timepoints are not evenly spaced.")

    return time_cols


def _smooth_time_series(data: pd.DataFrame, window: int) -> pd.DataFrame:
    """Apply centered rolling smoothing across time within each sample."""
    smoothed_data = data.copy()
    measurement_cols = _get_time_columns(data)

    smoothed_data[measurement_cols] = (
        smoothed_data[measurement_cols].T
        .rolling(window=window, min_periods=1, center=True)
        .mean()
        .T
    )

    long_df = smoothed_data.melt(
        id_vars=["Condition", "Sex"],
        value_vars=measurement_cols,
        var_name="Time",
        value_name="Value",
    )
    long_df["Time"] = long_df["Time"].astype(int)

    return long_df


def plot_smoothed_measurements_improved(
    data: pd.DataFrame,
    window: int = 5,
    figsize: tuple[int, int] = (10, 6),
):
    """Plot smoothed time-series data by condition and sex."""
    smoothed_data_long = _smooth_time_series(data, window=window)

    figure, ax = plt.subplots(figsize=figsize)
    sns.lineplot(
        data=smoothed_data_long,
        x="Time",
        y="Value",
        hue="Condition",
        style="Sex",
        errorbar=None,
        ax=ax,
    )
    ax.set_title("Smoothed Measurements")
    ax.set_xlabel("Time")
    ax.set_ylabel("Value")

    plt.close(figure)
    return figure


def generate_mock_time_series(num_samples: int = 80, num_timepoints: int = 90, seed: int | None = None) -> pd.DataFrame:
    """Generate mock time-series data for the demo."""
    rng = np.random.default_rng(seed)

    time_cols = [str(index) for index in range(num_timepoints)]
    time_series_data = pd.DataFrame(
        rng.random((num_samples, num_timepoints)),
        columns=time_cols,
    )

    metadata = pd.DataFrame(
        {
            "Sample_ID": [f"Sample_{index}" for index in range(1, num_samples + 1)],
            "Condition": rng.choice(["A", "B"], size=num_samples),
            "Sex": rng.choice(["Male", "Female"], size=num_samples),
        }
    )

    return pd.concat([metadata, time_series_data], axis=1)
