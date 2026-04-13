# Demo script for Day 2: extracting helper functions from a readable
# differential-expression workflow.

import numpy as np
import pandas as pd
from scipy import stats

DATA_PATH = "modules/day-01-readable/activities/activity-2/simulated_expression_matrix.csv"
df = pd.read_csv(DATA_PATH, index_col=0)


def prepare_expression_data(expression_matrix):
    """Log-transform the matrix, reshape it, and infer group labels."""
    log_expression_matrix = np.log2(expression_matrix + 1).copy()
    log_expression_matrix["gene"] = log_expression_matrix.index

    expression_long = log_expression_matrix.melt(
        id_vars="gene",
        var_name="sample",
        value_name="log_expression",
    )
    expression_long["group"] = expression_long["sample"].str.split("_").str[0]

    return expression_long


def compute_single_gene_stats(gene_data):
    """Run one t-test and keep the values used in the final results table."""
    gene_name = gene_data["gene"].iloc[0]
    control_values = gene_data.loc[
        gene_data["group"] == "Control", "log_expression"
    ]
    treatment_values = gene_data.loc[
        gene_data["group"] == "Treatment", "log_expression"
    ]

    ttest_results = stats.ttest_ind(control_values, treatment_values, equal_var=False)
    control_mean = control_values.mean()
    treatment_mean = treatment_values.mean()

    return pd.DataFrame(
        {
            "gene": [gene_name],
            "pval": [ttest_results.pvalue],
            "Control": [control_mean],
            "Treatment": [treatment_mean],
            "fc": [treatment_mean - control_mean],
        }
    )


def compute_gene_summaries(expression_long):
    """Apply the per-gene t-test summary to each gene and combine the results."""
    gene_summaries = [
        compute_single_gene_stats(gene_data)
        for _, gene_data in expression_long.groupby("gene")
    ]
    return pd.concat(gene_summaries, ignore_index=True)


def add_adjusted_pvalues(gene_summary):
    """Add BH-adjusted p-values after all per-gene tests are complete."""
    gene_summary = gene_summary.copy()
    gene_summary["padj"] = stats.false_discovery_control(
        gene_summary["pval"], method="bh"
    )
    return gene_summary


def build_gene_results(gene_summary):
    """Sort the combined results so the most significant genes appear first."""
    return gene_summary.sort_values("pval")


def find_de_genes(expression_matrix, alpha=0.05):
    """Return significant genes with p-values, means, and fold change."""
    expression_long = prepare_expression_data(expression_matrix)
    gene_summary = compute_gene_summaries(expression_long)
    gene_summary = add_adjusted_pvalues(gene_summary)
    gene_results = build_gene_results(gene_summary)

    return gene_results[gene_results["padj"] < alpha]


res = find_de_genes(df, alpha=0.05)
print(f"Number of significant genes: {len(res)}")
print("First few significant genes:")
print(res.head())
