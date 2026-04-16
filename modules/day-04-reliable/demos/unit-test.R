# Day 4 demo: minimal testthat checks for the smoothing helper.

library(testthat)

source("silent_break.R")

test_that("smooth_time_series returns expected values for typical data", {
  values <- data.frame(
    Sample_ID = c("Sample_1", "Sample_2"),
    Condition = c("A", "B"),
    Sex = c("Male", "Female"),
    `0` = c(0, 10),
    `1` = c(0, 10),
    `2` = c(6, 16),
    `3` = c(6, 16),
    check.names = FALSE
  )

  expected <- tibble::tibble(
    Condition = c("A", "B", "A", "B", "A", "B", "A", "B"),
    Sex = c("Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female"),
    Time = c(0, 0, 1, 1, 2, 2, 3, 3),
    Value = c(0, 10, 2, 12, 4, 14, 6, 16)
  ) |>
    dplyr::arrange(Condition, Sex, Time)

  actual <- smooth_time_series(values, window = 3) |>
    dplyr::arrange(Condition, Sex, Time)

  expect_equal(actual, expected)
})

test_that("smooth_time_series fails when timepoints are not evenly spaced", {
  values <- data.frame(
    Sample_ID = c("Sample_1", "Sample_2"),
    Condition = c("A", "B"),
    Sex = c("Male", "Female"),
    `0` = c(0, 10),
    `2` = c(6, 16),
    `3` = c(6, 16),
    check.names = FALSE
  )

  expect_error(
    smooth_time_series(values, window = 3),
    "Timepoints are not evenly spaced."
  )
})
