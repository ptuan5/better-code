"""Summarize workshop readiness scores for a small group of students."""

student_names = ["Ana", "Ben", "Cam", "Dev", "Eli", "Fay"]
exam_scores = [88, 91, 76, 95, 84, 79]
attendance_flags = [1, 1, 0, 1, 1, 0]
bonus_points = [2, 2, 0, 3, 1, 2]
late_days = [0, 1, 0, 0, 2, 1]


def final_score(score, attended_review, bonus, late_days):
    adjusted_score = (score * 0.85) + (attended_review * 10) + bonus - (late_days * 1.5)
    return min(adjusted_score, 100)


def performance_label(score):
    if score >= 90:
        return "ready"
    if score >= 80:
        return "close"
    return "review"


student_results = []

for name, score, attended_review, bonus, days_late in zip(
    student_names,
    exam_scores,
    attendance_flags,
    bonus_points,
    late_days,
):
    total_score = final_score(score, attended_review, bonus, days_late)
    student_results.append({"name": name, "final_score": total_score})

print("Workshop readiness results")
for result in student_results:
    print(result["name"], performance_label(result["final_score"]))

average_final_score = sum(result["final_score"] for result in student_results) / len(
    student_results
)
print("Average final score:", average_final_score)

ready_count = 0
close_count = 0
review_count = 0

for result in student_results:
    label = performance_label(result["final_score"])
    if label == "ready":
        ready_count += 1
    elif label == "close":
        close_count += 1
    else:
        review_count += 1

print(
    "Counts by label:",
    {"ready": ready_count, "close": close_count, "review": review_count},
)
