student_names <- c("Ana", "Ben", "Cam", "Dev", "Eli")
exam_scores <- c(88, 91, 76, 95, 84)
attendance_flags <- c(1, 1, 0, 1, 1)
bonus_points <- c(2, 2, 0, 3, 1)

gradebook <- data.frame(
  student_name = student_names,
  exam_score = exam_scores,
  attended_review = attendance_flags,
  bonus_points = bonus_points
)

gradebook$final_score <-
  (gradebook$exam_score * 0.8) +
  (gradebook$attended_review * 10) +
  gradebook$bonus_points

score_to_label <- function(score) {
  if (score >= 90) {
    return("did great")
  }

  if (score >= 80) {
    return("ok")
  }

  "needs help"
}

cat("Student results\n")

for (row_index in seq_len(nrow(gradebook))) {
  student <- gradebook$student_name[row_index]
  label <- score_to_label(gradebook$final_score[row_index])
  cat(student, label, "\n")
}

cat("Average final score:", mean(gradebook$final_score), "\n")
