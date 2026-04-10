def pass_rate(scores, passing_score=60):
    passed = [score > passing_score for score in scores]
    return sum(passed) / len(scores) * 100


def course_label(rate):
    if rate > 90:
        return "excellent"
    if rate > 70:
        return "on track"
    return "needs support"


def course_summary(scores, passing_score=60):
    rate = pass_rate(scores, passing_score)
    return f"Pass rate = {rate:.1f} - {course_label(rate)}"


scores_a = [55, 60, 62, 90]
scores_b = [60, 60, 60]
scores_c = [45, 72, 82]

print(course_summary(scores_a))
print(course_summary(scores_b))
print(course_summary(scores_c))
