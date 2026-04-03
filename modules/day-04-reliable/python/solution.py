def pass_rate(scores, passing_score=60):
    if not scores:
        raise ValueError("scores must contain at least one value")

    passed = [score >= passing_score for score in scores]
    return sum(passed) / len(scores) * 100


def run_checks():
    assert pass_rate([55, 60, 62, 90]) == 75
    assert pass_rate([60, 60, 60]) == 100

    try:
        pass_rate([])
    except ValueError:
        pass
    else:
        raise AssertionError("Empty input should raise ValueError")

    print("All checks passed")


if __name__ == "__main__":
    run_checks()
