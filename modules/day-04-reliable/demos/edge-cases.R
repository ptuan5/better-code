# Demo script for Day 4: plausible interval-overlap code with hidden reliability problems.

overlap_score <- function(start_a, end_a, start_b, end_b) {
  overlap <- min(end_a, end_b) - max(start_a, start_b)
  union <- max(end_a, end_b) - min(start_a, start_b)
  overlap / union
}

agreement_label <- function(score) {
  if (score > 0.75) {
    return("strong")
  }

  if (score > 0.4) {
    return("mixed")
  }

  "weak"
}

agreement_summary <- function(start_a, end_a, start_b, end_b) {
  score <- overlap_score(start_a, end_a, start_b, end_b)
  paste("Agreement =", round(score, 3), "-", agreement_label(score))
}

cat(agreement_summary(10, 20, 15, 25), "\n")
cat(agreement_summary(5, 8, 8, 10), "\n")
cat(agreement_summary(30, 40, 50, 55), "\n")
