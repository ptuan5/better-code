# Day 4 demo helpers for the silent-break examples.

get_time_columns <- function(data) {
  time_cols <- names(data)[grepl("^\\d+$", names(data))]
  time_cols <- time_cols[order(as.integer(time_cols))]

  timepoints <- as.integer(time_cols)
  if (length(timepoints) > 1) {
    diffs <- diff(timepoints)
    if (!all(diffs == diffs[1])) {
      stop("Timepoints are not evenly spaced.", call. = FALSE)
    }
  }

  time_cols
}


smooth_time_series <- function(data, window = 5) {
  measurement_cols <- get_time_columns(data)
  measurement_matrix <- as.matrix(data[measurement_cols])

  smoothed_matrix <- t(apply(
    measurement_matrix,
    1,
    function(row_values) {
      zoo::rollapply(
        row_values,
        width = window,
        FUN = mean,
        align = "center",
        partial = TRUE
      )
    }
  ))

  colnames(smoothed_matrix) <- measurement_cols
  smoothed_data <- data
  smoothed_data[measurement_cols] <- as.data.frame(smoothed_matrix)

  smoothed_data |>
    dplyr::select(dplyr::all_of(c("Condition", "Sex", measurement_cols))) |>
    tidyr::pivot_longer(
      cols = dplyr::all_of(measurement_cols),
      names_to = "Time",
      values_to = "Value"
    ) |>
    dplyr::mutate(Time = as.numeric(Time))
}


plot_smoothed_measurements_improved <- function(data, window = 5) {
  smoothed_data_long <- smooth_time_series(data, window = window)

  ggplot2::ggplot(
    smoothed_data_long,
    ggplot2::aes(x = Time, y = Value, color = Condition, linetype = Sex)
  ) +
    ggplot2::geom_line() +
    ggplot2::labs(title = "Smoothed Measurements", x = "Time", y = "Value") +
    ggplot2::theme_bw()
}


generate_mock_time_series <- function(num_samples = 80, num_timepoints = 90, seed = NULL) {
  if (!is.null(seed)) {
    set.seed(seed)
  }

  time_cols <- as.character(0:(num_timepoints - 1))
  time_series_data <- as.data.frame(matrix(
    runif(num_samples * num_timepoints),
    nrow = num_samples,
    ncol = num_timepoints
  ))
  names(time_series_data) <- time_cols

  metadata <- data.frame(
    Sample_ID = paste0("Sample_", seq_len(num_samples)),
    Condition = sample(c("A", "B"), num_samples, replace = TRUE),
    Sex = sample(c("Male", "Female"), num_samples, replace = TRUE),
    stringsAsFactors = FALSE
  )

  cbind(metadata, time_series_data, stringsAsFactors = FALSE)
}
