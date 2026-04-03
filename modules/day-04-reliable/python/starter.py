def pass_rate(scores, passing_score=60):
    passed = [score > passing_score for score in scores]
    return sum(passed) / len(scores) * 100


scores_a = [55, 60, 62, 90]
scores_b = []

print(pass_rate(scores_a))
print(pass_rate(scores_b))
