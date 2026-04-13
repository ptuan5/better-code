# Demo script for Day 4: a few focused checks for the corrected overlap behavior.

overlap_score <- function(start_a, end_a, start_b, end_b) {
  if (end_a < start_a || end_b < start_b) {
    stop("end frame must be greater than or equal to start frame")
  }

  overlap <- max(0, min(end_a, end_b) - max(start_a, start_b) + 1)
  union <- max(end_a, end_b) - min(start_a, start_b) + 1
  overlap / union
}

agreement_label <- function(score) {
  if (score >= 0.75) {
    return("strong")
  }

  if (score >= 0.4) {
    return("mixed")
  }

  "weak"
}

stopifnot(round(overlap_score(10, 20, 15, 25), 3) == 0.375)
stopifnot(round(overlap_score(5, 8, 8, 10), 3) == 0.167)
stopifnot(overlap_score(30, 40, 50, 55) == 0)
stopifnot(agreement_label(0.75) == "strong")
stopifnot(agreement_label(0.4) == "mixed")

invalid_interval_failed <- FALSE

tryCatch(
  {
    overlap_score(12, 10, 15, 20)
  },
  error = function(e) {
    invalid_interval_failed <<- TRUE
  }
)

stopifnot(invalid_interval_failed)
cat("All demo checks passed\n")
