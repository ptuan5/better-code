pass_rate <- function(scores, passing_score = 60) {
  if (length(scores) == 0) {
    stop("scores must contain at least one value")
  }

  passed <- scores >= passing_score
  sum(passed) / length(scores) * 100
}

course_label <- function(rate) {
  if (rate >= 90) {
    return("excellent")
  }

  if (rate >= 70) {
    return("on track")
  }

  "needs support"
}

course_summary <- function(scores, passing_score = 60) {
  rate <- pass_rate(scores, passing_score)
  paste("Pass rate =", round(rate, 1), "-", course_label(rate))
}

run_checks <- function() {
  stopifnot(pass_rate(c(55, 60, 62, 90)) == 75)
  stopifnot(pass_rate(c(60, 60, 60)) == 100)
  stopifnot(course_label(90) == "excellent")
  stopifnot(course_label(70) == "on track")

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
  cat(course_summary(c(55, 60, 62, 90)), "\n")
  cat("All checks passed\n")
}

run_checks()
