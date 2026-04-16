#!/usr/bin/env Rscript
# ------------------------------------------
# Example tests for Day 4 Activity 2.
# Run with: Rscript test_example_functions.R
# ------------------------------------------
library(testthat)
source("example_functions.R")

build_mock_box_pairs <- function() {
  data.frame(
    scenario = c("touching_edge", "invalid_box", "normal_overlap"),
    box_a_x1 = c(0, 0, 0),
    box_a_y1 = c(0, 0, 0),
    box_a_x2 = c(1, 1, 2),
    box_a_y2 = c(1, 1, 2),
    box_b_x1 = c(1, 2, 1),
    box_b_y1 = c(0, 2, 1),
    box_b_x2 = c(2, 1, 3),
    box_b_y2 = c(1, 3, 3)
  )
}

test_that("compute_iou returns zero for touching boxes", {
  box_a <- c(0, 0, 1, 1)
  box_b <- c(1, 0, 2, 1)

  expect_equal(compute_iou(box_a, box_b), 0)
})

test_that("add_iou_all_frames marks bad rows as missing", {
  scored_pairs <- add_iou_all_frames(build_mock_box_pairs())

  expect_equal(sum(is.na(scored_pairs$iou)), 1)
  expect_equal(sum(is.na(scored_pairs$iou[scored_pairs$scenario == "invalid_box"])), 1)
})

test_that("build_agreement_curve keeps missing rows in the denominator", {
  scored_pairs <- add_iou_all_frames(build_mock_box_pairs())
  curve_info <- build_agreement_curve(scored_pairs)
  agreement_at_zero <- curve_info$percent_agreement[curve_info$iou_threshold == 0]

  expect_equal(agreement_at_zero, 2/3 * 100)
})
