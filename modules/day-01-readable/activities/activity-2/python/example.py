"""Prioritize a small set of genes for follow-up plots."""

gene_names = ["LIF", "SOCS3", "STAT3", "MALAT1", "IL6", "NEAT1"]
mean_signal = [10.4, 9.7, 8.9, 7.5, 6.8, 8.1]
signal_spread = [2.1, 1.8, 1.6, 0.7, 2.4, 1.1]
zero_sample_count = [0, 0, 1, 2, 3, 1]
followup_bonus = [2, 2, 1, 0, 3, 1]


def calculate_priority_score(mean_signal_value, signal_spread_value, zero_samples, bonus):
    raw_score = (mean_signal_value * 1.2) + (signal_spread_value * 3) + bonus - (
        zero_samples * 1.5
    )
    return min(raw_score, 20)


def priority_label(priority_score):
    if priority_score >= 15:
        return "plot"
    if priority_score >= 11:
        return "check"
    return "ignore"


gene_results = []

for gene_name, signal_value, spread_value, zero_samples, bonus in zip(
    gene_names,
    mean_signal,
    signal_spread,
    zero_sample_count,
    followup_bonus,
):
    priority_score = calculate_priority_score(
        signal_value, spread_value, zero_samples, bonus
    )
    gene_results.append({"gene_name": gene_name, "priority_score": priority_score})

print("Gene follow-up priorities")
for result in gene_results:
    print(result["gene_name"], priority_label(result["priority_score"]))

average_priority_score = sum(
    result["priority_score"] for result in gene_results
) / len(gene_results)
print("Average priority score:", average_priority_score)

plot_count = 0
check_count = 0
ignore_count = 0

for result in gene_results:
    label = priority_label(result["priority_score"])
    if label == "plot":
        plot_count += 1
    elif label == "check":
        check_count += 1
    else:
        ignore_count += 1

print(
    "Counts by label:",
    {"plot": plot_count, "check": check_count, "ignore": ignore_count},
)
