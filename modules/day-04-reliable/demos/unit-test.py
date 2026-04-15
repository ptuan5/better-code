"""Day 4 demo: pytest checks for the moving-average silent break."""

from importlib import util
from pathlib import Path

import numpy as np
import pytest


MODULE_PATH = Path(__file__).with_name("silent-break.py")
SPEC = util.spec_from_file_location("day4_edge_cases", MODULE_PATH)
EDGE_CASES = util.module_from_spec(SPEC)

if SPEC.loader is None:
    raise RuntimeError(f"Could not load demo module from {MODULE_PATH}")

SPEC.loader.exec_module(EDGE_CASES)


def reference_moving_average_rows(values, window=3):
    matrix = np.asarray(values, dtype=float)
    return np.apply_along_axis(
        EDGE_CASES.centered_moving_average_1d,
        axis=0,
        arr=matrix,
        window=window,
    )


def test_moving_average_smooths_down_rows():
    values = EDGE_CASES.build_time_series_example()
    expected = reference_moving_average_rows(values, window=3)
    actual = EDGE_CASES.moving_average_rows(values, window=3)

    assert np.allclose(actual, expected)


def test_window_one_keeps_a_single_row_matrix_unchanged():
    values = np.array([[5.0, 50.0, 500.0]])
    actual = EDGE_CASES.moving_average_rows(values, window=1)

    assert np.array_equal(actual, values)


def test_window_larger_than_number_of_rows_raises_value_error():
    values = EDGE_CASES.build_time_series_example()

    with pytest.raises(ValueError, match="window cannot be larger than the number of rows"):
        EDGE_CASES.moving_average_rows(values, window=5)
