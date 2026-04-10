def pass_rate(scores, passing_score=60):
    if not scores:
        raise ValueError("scores must contain at least one value")

    passed = [score >= passing_score for score in scores]
    return sum(passed) / len(scores) * 100


def course_label(rate):
    if rate >= 90:
        return "excellent"
    if rate >= 70:
        return "on track"
    return "needs support"


def course_summary(scores, passing_score=60):
    rate = pass_rate(scores, passing_score)
    return f"Pass rate = {rate:.1f} - {course_label(rate)}"


def run_checks():
    assert pass_rate([55, 60, 62, 90]) == 75
    assert pass_rate([60, 60, 60]) == 100
    assert course_label(90) == "excellent"
    assert course_label(70) == "on track"

    try:
        pass_rate([])
    except ValueError:
        pass
    else:
        raise AssertionError("Empty input should raise ValueError")

    print(course_summary([55, 60, 62, 90]))
    print("All checks passed")


if __name__ == "__main__":
    run_checks()
