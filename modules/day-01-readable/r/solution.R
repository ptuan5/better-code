# Summarize workshop readiness scores for a small group of students.

student_names <- c("Ana", "Ben", "Cam", "Dev", "Eli", "Fay")
exam_scores <- c(88, 91, 76, 95, 84, 79)
attendance_flags <- c(1, 1, 0, 1, 1, 0)
bonus_points <- c(2, 2, 0, 3, 1, 2)
late_days <- c(0, 1, 0, 0, 2, 1)

calculate_final_score <- function(exam_score, attended_review, bonus, late_days) {
  score <- (exam_score * 0.85) + (attended_review * 10) + bonus - (late_days * 1.5)
  min(score, 100)
}

score_to_label <- function(score) {
  if (score >= 90) {
    return("ready")
  }

  if (score >= 80) {
    return("close")
  }

  "review"
}

gradebook <- data.frame(
  student_name = student_names,
  exam_score = exam_scores,
  attended_review = attendance_flags,
  bonus_points = bonus_points,
  late_days = late_days
)

gradebook$final_score <- mapply(
  calculate_final_score,
  gradebook$exam_score,
  gradebook$attended_review,
  gradebook$bonus_points,
  gradebook$late_days
)

cat("Workshop readiness results\n")

for (row_index in seq_len(nrow(gradebook))) {
  student <- gradebook$student_name[row_index]
  label <- score_to_label(gradebook$final_score[row_index])
  cat(student, label, "\n")
}

average_final_score <- mean(gradebook$final_score)
readiness_labels <- vapply(gradebook$final_score, score_to_label, character(1))
label_counts <- table(factor(readiness_labels, levels = c("ready", "close", "review")))

cat("Average final score:", average_final_score, "\n")
cat(
  "Counts by label:",
  "ready =", label_counts["ready"],
  "close =", label_counts["close"],
  "review =", label_counts["review"],
  "\n"
)
