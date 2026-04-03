pass_rate <- function(scores, passing_score = 60) {
  if (length(scores) == 0) {
    stop("scores must contain at least one value")
  }

  passed <- scores >= passing_score
  sum(passed) / length(scores) * 100
}

run_checks <- function() {
  stopifnot(pass_rate(c(55, 60, 62, 90)) == 75)
  stopifnot(pass_rate(c(60, 60, 60)) == 100)

  empty_input_failed <- FALSE

  tryCatch(
    {
      pass_rate(c())
    },
    error = function(e) {
      empty_input_failed <<- TRUE
    }
  )

  stopifnot(empty_input_failed)
  cat("All checks passed\n")
}

run_checks()
