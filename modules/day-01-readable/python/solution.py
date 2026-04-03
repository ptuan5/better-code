student_names = ["Ana", "Ben", "Cam", "Dev", "Eli"]
exam_scores = [88, 91, 76, 95, 84]
attendance_flags = [1, 1, 0, 1, 1]
bonus_points = [2, 2, 0, 3, 1]


def final_score(score, attended_review, bonus):
    return (score * 0.8) + (attended_review * 10) + bonus


def performance_label(score):
    if score >= 90:
        return "did great"
    if score >= 80:
        return "ok"
    return "needs help"


student_results = []

for name, score, attended_review, bonus in zip(
    student_names, exam_scores, attendance_flags, bonus_points
):
    total = final_score(score, attended_review, bonus)
    student_results.append({"name": name, "final_score": total})

print("Student results")
for result in student_results:
    print(result["name"], performance_label(result["final_score"]))

average_score = sum(result["final_score"] for result in student_results) / len(student_results)
print("Average final score:", average_score)
