# Demo script for Day 2: extracting helper functions from a readable
# differential-expression workflow.

import numpy as np
import pandas as pd
from scipy import stats

df = pd.read_csv("simulated_expression_matrix.csv", index_col=0)


def prepare_expression_data(expression_matrix):
    # Prepare the expression matrix for per-gene testing by log-transforming the
    # values, reshaping to long format, and pulling the group label from the sample name.
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
    # Run one t-test for a single gene and keep the values we want in the final
    # results table. SciPy does not return group means, so we calculate them from
    # the same grouped values used in the test.
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
            "pval": [ttest_results.pvalue],
            "Control": [control_mean],
            "Treatment": [treatment_mean],
            "fc": [treatment_mean - control_mean],
        }
    )


def find_de_genes(expression_matrix, alpha=0.05):
    """
    Identify differentially expressed genes between two groups (e.g., Control vs Treatment)
    using log2-transformed data, t-tests, and BH-adjusted p-values.

    Args:
        expression_matrix : pandas.DataFrame
            Numeric expression matrix with genes as rows and samples as columns.
            Column names must encode group labels (e.g., "Control_1").
        alpha : float, optional
            Significance threshold for adjusted p-values (default is 0.05).

    Returns:
        A pandas.DataFrame of significant genes (padj < alpha) with p-values,
        adjusted p-values, group means, and log2 fold change.

    Notes:
        Assumes exactly two groups inferred from sample names.
    """
    expression_long = prepare_expression_data(expression_matrix)

    # Apply the per-gene t-test function and combine the results into a single data frame.
    gene_stats = pd.concat(
        {
            gene: compute_single_gene_stats(gene_data)
            for gene, gene_data in expression_long.groupby("gene")
        },
        names=["gene"],
    ).reset_index(level="gene").reset_index(drop=True)

    gene_stats["padj"] = stats.false_discovery_control(gene_stats["pval"], method="bh")
    significant_genes = gene_stats.loc[gene_stats["padj"] < alpha].sort_values("pval")

    return significant_genes


res = find_de_genes(df, alpha=0.05)
print(f"Number of significant genes: {len(res)}")
print("First few significant genes:")
print(res.head())
