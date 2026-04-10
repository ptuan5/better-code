pass_rate <- function(scores, passing_score = 60) {
  passed <- scores > passing_score
  sum(passed) / length(scores) * 100
}

course_label <- function(rate) {
  if (rate > 90) {
    return("excellent")
  }

  if (rate > 70) {
    return("on track")
  }

  "needs support"
}

course_summary <- function(scores, passing_score = 60) {
  rate <- pass_rate(scores, passing_score)
  paste("Pass rate =", round(rate, 1), "-", course_label(rate))
}

scores_a <- c(55, 60, 62, 90)
scores_b <- c(60, 60, 60)
scores_c <- c(45, 72, 82)

print(course_summary(scores_a))
print(course_summary(scores_b))
print(course_summary(scores_c))
