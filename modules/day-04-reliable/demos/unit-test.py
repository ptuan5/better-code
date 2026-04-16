"""Day 4 demo: minimal pytest checks for the smoothing helper."""

import pandas as pd
import pytest

from slient_break import _smooth_time_series


def test_smooth_time_series_returns_expected_values_for_typical_data():
    values = pd.DataFrame(
        {
            "Sample_ID": ["Sample_1", "Sample_2"],
            "Condition": ["A", "B"],
            "Sex": ["Male", "Female"],
            "0": [0.0, 10.0],
            "1": [0.0, 10.0],
            "2": [6.0, 16.0],
            "3": [6.0, 16.0],
        }
    )

    expected = pd.DataFrame(
        {
            "Condition": ["A", "B", "A", "B", "A", "B", "A", "B"],
            "Sex": ["Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female"],
            "Time": [0, 0, 1, 1, 2, 2, 3, 3],
            "Value": [0.0, 10.0, 2.0, 12.0, 4.0, 14.0, 6.0, 16.0],
        }
    ).sort_values(["Condition", "Sex", "Time"]).reset_index(drop=True)

    actual = (
        _smooth_time_series(values, window=3)
        .sort_values(["Condition", "Sex", "Time"])
        .reset_index(drop=True)
    )

    pd.testing.assert_frame_equal(actual, expected)


def test_smooth_time_series_fails_when_timepoints_are_not_evenly_spaced():
    values = pd.DataFrame(
        {
            "Sample_ID": ["Sample_1", "Sample_2"],
            "Condition": ["A", "B"],
            "Sex": ["Male", "Female"],
            "0": [0.0, 10.0],
            "2": [6.0, 16.0],
            "3": [6.0, 16.0],
        }
    )

    with pytest.raises(AssertionError, match="Timepoints are not evenly spaced."):
        _smooth_time_series(values, window=3)
