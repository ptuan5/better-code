# Demo script for Day 2: extracting helper functions from a readable
# differential-expression workflow.

import numpy as np
import pandas as pd
from scipy import stats

DATA_PATH = "modules/day-01-readable/activities/activity-2/simulated_expression_matrix.csv"
df = pd.read_csv(DATA_PATH, index_col=0)


def prepare_expression_data(expression_matrix):
    log_expression_matrix = np.log2(expression_matrix + 1).copy()
    log_expression_matrix["gene"] = log_expression_matrix.index

    expression_long = log_expression_matrix.melt(
        id_vars="gene",
        var_name="sample",
        value_name="log_expression",
    )
    expression_long["group"] = expression_long["sample"].str.split("_").str[0]

    return expression_long


def compute_gene_pvalues(expression_long):
    gene_pvalues = []
    genes = []

    for gene, gene_data in expression_long.groupby("gene"):
        groups = list(gene_data["group"].unique())
        group_1 = gene_data.loc[gene_data["group"] == groups[0], "log_expression"]
        group_2 = gene_data.loc[gene_data["group"] == groups[1], "log_expression"]

        ttest_results = stats.ttest_ind(group_1, group_2, equal_var=False)
        gene_pvalues.append(ttest_results.pvalue)
        genes.append(gene)

    return pd.DataFrame(
        {
            "gene": genes,
            "pval": gene_pvalues,
            "padj": stats.false_discovery_control(gene_pvalues, method="bh"),
        }
    )


def summarize_group_means(expression_long):
    group_means = (
        expression_long.groupby(["gene", "group"], as_index=False)["log_expression"].mean()
    )
    mean_summary = (
        group_means.pivot(index="gene", columns="group", values="log_expression")
        .reset_index()
    )
    mean_summary["fc"] = mean_summary["Treatment"] - mean_summary["Control"]

    return mean_summary


def build_gene_results(pvalue_summary, mean_summary):
    return pvalue_summary.merge(mean_summary, on="gene").sort_values("pval")


def find_de_genes(expression_matrix, alpha=0.05):
    expression_long = prepare_expression_data(expression_matrix)
    pvalue_summary = compute_gene_pvalues(expression_long)
    mean_summary = summarize_group_means(expression_long)
    gene_results = build_gene_results(pvalue_summary, mean_summary)

    return gene_results[gene_results["padj"] < alpha]


res = find_de_genes(df, alpha=0.05)
print(f"Number of significant genes: {len(res)}")
print("First few significant genes:")
print(res.head())
