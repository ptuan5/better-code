# Day 4 demo: two silent-break examples with plausible but wrong behavior.

centered_moving_average_1d <- function(values, window = 3) {
  if (!is.numeric(values) || length(values) == 0) {
    stop("values must be a non-empty numeric vector")
  }

  if (!is.numeric(window) || length(window) != 1 || window < 1 || window %% 1 != 0) {
    stop("window must be a positive integer")
  }

  half_window <- floor(window / 2)
  smoothed <- numeric(length(values))

  for (index in seq_along(values)) {
    start <- max(1, index - half_window)
    stop <- min(length(values), index + half_window)
    smoothed[index] <- mean(values[start:stop])
  }

  smoothed
}

moving_average_rows <- function(values, window = 3) {
  # Buggy on purpose: this should smooth down rows, but smooths across columns.
  matrix_values <- as.matrix(values)

  if (
    !is.numeric(matrix_values) ||
      length(dim(matrix_values)) != 2 ||
      nrow(matrix_values) == 0 ||
      ncol(matrix_values) == 0
  ) {
    stop("values must be a non-empty numeric matrix")
  }

  if (!is.numeric(window) || length(window) != 1 || window < 1 || window %% 1 != 0) {
    stop("window must be a positive integer")
  }

  if (window > nrow(matrix_values)) {
    stop("window cannot be larger than the number of rows")
  }

  t(apply(matrix_values, 1, centered_moving_average_1d, window = window))
}

build_time_series_example <- function() {
  matrix(
    c(
      1, 10, 100,
      2, 20, 200,
      3, 30, 300,
      4, 40, 400
    ),
    nrow = 4,
    byrow = TRUE
  )
}

build_expression_groups <- function(with_outlier = FALSE) {
  groups <- list(
    control = c(8.2, 8.4, 8.5, 8.7, 8.9, 9.0),
    treated = c(10.1, 10.2, 10.4, 10.5, 10.7, 10.8),
    rescued = c(11.8, 12.0, 12.2, 12.3, 12.5, 12.6)
  )

  if (with_outlier) {
    groups$treated <- c(groups$treated, 14.8)
  }

  groups
}

plot_boxplot_with_jitter <- function(groups, title_text) {
  boxplot(groups, main = title_text, ylab = "Mean expression")
  stripchart(
    groups,
    vertical = TRUE,
    method = "jitter",
    pch = 16,
    col = "black",
    add = TRUE
  )
}

run_demo_1a <- function() {
  values <- build_time_series_example()
  smoothed <- moving_average_rows(values, window = 3)

  cat("Demo 1a: silent break - moving average\n")
  cat("Rows are time points; columns are samples.\n")
  cat("Input matrix:\n")
  print(values)
  cat("\n")
  cat("Output from the current function:\n")
  print(round(smoothed, 2))
  cat("\n")
  cat("Question: did we smooth over time, or across samples?\n")

  invisible(list(values = values, smoothed = smoothed))
}

run_demo_1b <- function() {
  old_par <- par(no.readonly = TRUE)
  on.exit(par(old_par), add = TRUE)

  par(mfrow = c(1, 2))
  plot_boxplot_with_jitter(build_expression_groups(with_outlier = FALSE), "No obvious outlier")
  plot_boxplot_with_jitter(build_expression_groups(with_outlier = TRUE), "Outlier appears twice")

  cat("Demo 1b: silent break - boxplot plus jitter\n")
  cat("The second panel uses the same plotting code.\n")
  cat("Question: when an outlier appears, is it drawn once or twice?\n")
}

if (sys.nframe() == 0) {
  run_demo_1a()
  run_demo_1b()
}
