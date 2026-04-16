#!/usr/bin/env python3
"""
Example pytest tests for Day 4 Activity 2.

Run with:
    pytest test_example_functions.py
"""
import pandas as pd
import pytest

from example_functions import add_iou_all_frames, build_agreement_curve, compute_iou


def build_mock_box_pairs():
    return pd.DataFrame(
        [
            {
                "scenario": "touching_edge",
                "box_a_x1": 0.0,
                "box_a_y1": 0.0,
                "box_a_x2": 1.0,
                "box_a_y2": 1.0,
                "box_b_x1": 1.0,
                "box_b_y1": 0.0,
                "box_b_x2": 2.0,
                "box_b_y2": 1.0,
            },
            {
                "scenario": "invalid_box",
                "box_a_x1": 0.0,
                "box_a_y1": 0.0,
                "box_a_x2": 1.0,
                "box_a_y2": 1.0,
                "box_b_x1": 2.0,
                "box_b_y1": 2.0,
                "box_b_x2": 1.0,
                "box_b_y2": 3.0,
            },
            {
                "scenario": "normal_overlap",
                "box_a_x1": 0.0,
                "box_a_y1": 0.0,
                "box_a_x2": 2.0,
                "box_a_y2": 2.0,
                "box_b_x1": 1.0,
                "box_b_y1": 1.0,
                "box_b_x2": 3.0,
                "box_b_y2": 3.0,
            },
        ]
    )

def test_compute_iou_returns_zero_for_touching_boxes():
    box_a = [0.0, 0.0, 1.0, 1.0]
    box_b = [1.0, 0.0, 2.0, 1.0]

    assert compute_iou(box_a, box_b) == 0


def test_add_iou_all_frames_marks_bad_rows_missing():
    scored_pairs = add_iou_all_frames(build_mock_box_pairs())

    assert scored_pairs["iou"].isna().sum() == 1
    assert scored_pairs.loc[scored_pairs["scenario"] == "invalid_box", "iou"].isna().sum() == 1


def test_build_agreement_curve_keeps_missing_rows_in_denominator():
    scored_pairs = add_iou_all_frames(build_mock_box_pairs())
    curve_info = build_agreement_curve(scored_pairs)
    agreement_at_zero = curve_info.loc[
        curve_info["iou_threshold"] == 0, "percent_agreement"
    ].iat[0]

    assert agreement_at_zero == 2/3 * 100
