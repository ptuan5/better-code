def overlap_score(start_a, end_a, start_b, end_b):
    if end_a < start_a or end_b < start_b:
        raise ValueError("end frame must be greater than or equal to start frame")

    overlap = max(0, min(end_a, end_b) - max(start_a, start_b) + 1)
    union = max(end_a, end_b) - min(start_a, start_b) + 1
    return overlap / union


def agreement_label(score):
    if score >= 0.75:
        return "strong"
    if score >= 0.4:
        return "mixed"
    return "weak"


def agreement_summary(start_a, end_a, start_b, end_b):
    score = overlap_score(start_a, end_a, start_b, end_b)
    return f"Agreement = {score:.3f} - {agreement_label(score)}"


def run_checks():
    assert round(overlap_score(10, 20, 15, 25), 3) == 0.375
    assert round(overlap_score(5, 8, 8, 10), 3) == 0.167
    assert overlap_score(30, 40, 50, 55) == 0
    assert agreement_label(0.75) == "strong"
    assert agreement_label(0.4) == "mixed"

    try:
        overlap_score(12, 10, 15, 20)
    except ValueError:
        pass
    else:
        raise AssertionError("Invalid interval should raise ValueError")

    print(agreement_summary(10, 20, 15, 25))
    print("All checks passed")


if __name__ == "__main__":
    run_checks()
