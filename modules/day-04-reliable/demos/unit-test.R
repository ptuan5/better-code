# Day 4 demo: testthat checks for the moving-average silent break.

library(testthat)

current_file_path <- function() {
  command_args <- commandArgs(trailingOnly = FALSE)
  file_argument <- grep("^--file=", command_args, value = TRUE)

  if (length(file_argument) > 0) {
    return(normalizePath(sub("^--file=", "", file_argument[[1]])))
  }

  frames <- sys.frames()

  for (index in rev(seq_along(frames))) {
    if (!is.null(frames[[index]]$ofile)) {
      return(normalizePath(frames[[index]]$ofile))
    }
  }

  NULL
}

demo_directory <- function() {
  file_path <- current_file_path()

  if (!is.null(file_path)) {
    return(dirname(file_path))
  }

  project_root <- Sys.getenv("PWD", unset = "")
  fallback_directory <- normalizePath(
    file.path(project_root, "modules", "day-04-reliable", "demos"),
    mustWork = FALSE
  )

  if (file.exists(file.path(fallback_directory, "silent-break.R"))) {
    return(fallback_directory)
  }

  stop("Could not determine the demo directory")
}

DEMO_DIR <- demo_directory()
source(file.path(DEMO_DIR, "silent-break.R"), local = TRUE)

reference_moving_average_rows <- function(values, window = 3) {
  matrix_values <- as.matrix(values)

  vapply(
    seq_len(ncol(matrix_values)),
    function(column_index) {
      centered_moving_average_1d(matrix_values[, column_index], window = window)
    },
    numeric(nrow(matrix_values))
  )
}

test_that("moving average smooths down rows", {
  values <- build_time_series_example()
  expected <- reference_moving_average_rows(values, window = 3)
  actual <- moving_average_rows(values, window = 3)

  expect_equal(actual, expected)
})

test_that("window 1 keeps a single-row matrix unchanged", {
  values <- matrix(c(5, 50, 500), nrow = 1)
  actual <- moving_average_rows(values, window = 1)

  expect_equal(actual, values)
})

test_that("window larger than the number of rows errors clearly", {
  values <- build_time_series_example()

  expect_error(
    moving_average_rows(values, window = 5),
    "window cannot be larger than the number of rows"
  )
})
