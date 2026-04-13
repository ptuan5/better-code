# Demo script for Day 4: plausible interval-overlap code with hidden reliability problems.

def overlap_score(start_a, end_a, start_b, end_b):
    overlap = min(end_a, end_b) - max(start_a, start_b)
    union = max(end_a, end_b) - min(start_a, start_b)
    return overlap / union


def agreement_label(score):
    if score > 0.75:
        return "strong"
    if score > 0.4:
        return "mixed"
    return "weak"


def agreement_summary(start_a, end_a, start_b, end_b):
    score = overlap_score(start_a, end_a, start_b, end_b)
    return f"Agreement = {score:.3f} - {agreement_label(score)}"


print(agreement_summary(10, 20, 15, 25))
print(agreement_summary(5, 8, 8, 10))
print(agreement_summary(30, 40, 50, 55))
