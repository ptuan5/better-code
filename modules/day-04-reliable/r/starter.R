pass_rate <- function(scores, passing_score = 60) {
  passed <- scores > passing_score
  sum(passed) / length(scores) * 100
}

scores_a <- c(55, 60, 62, 90)
scores_b <- c()

print(pass_rate(scores_a))
print(pass_rate(scores_b))
