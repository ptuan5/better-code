# This script identifies genes with differential expression between Control and
# Treatment samples and prints the significant-gene count plus a result preview.

import numpy as np
import pandas as pd
from scipy import stats

df = pd.read_csv("simulated_expression_matrix.csv", index_col=0)

def find_de_genes(expression_matrix, alpha=0.05):
    """
    Identify differentially expressed genes between two groups (e.g., Control vs Treatment)
    using log2-transformed data, t-tests, and BH-adjusted p-values.

    Args:
        expression_matrix : pandas.DataFrame or numpy.ndarray
            Gene expression matrix with genes as rows and samples as columns.
            Column names must encode group labels (e.g., "Control_1").
        alpha : float, optional
            Significance threshold for adjusted p-values (default is 0.05).

    Returns:    
        A pandas.DataFrame of significant genes (padj < alpha) including:
            - p-values
            - adjusted p-values
            - group mean log2 expression
            - log2 fold change

    Notes:
        Assumes exactly two groups inferred from sample names.
    """
    # Log 2 transformation
    log_expression_matrix = np.log2(expression_matrix + 1)
    log_expression_matrix["gene"] = log_expression_matrix.index

    # Reshape to long format
    expression_long = log_expression_matrix.melt(id_vars="gene", 
                                                 var_name="sample", 
                                                 value_name="value")

    # Infer group (control or treatment) from sample names
    expression_long["group"] = [i.split("_")[0] for i in expression_long["sample"]]

    # Perform t-test for each gene
    gene_pvalues = np.array([])
    genes = np.array([])
    for gene, gene_data in expression_long.groupby("gene"):
        groups = list(gene_data["group"].unique())
        g1 = gene_data.loc[gene_data["group"] == groups[0], "value"]
        g2 = gene_data.loc[gene_data["group"] == groups[1], "value"]

        ttest_results = stats.ttest_ind(g1, g2, equal_var=False)
        gene_pvalues = np.append(gene_pvalues, ttest_results.pvalue)
        genes = np.append(genes, gene)

    adjusted_pvalues = stats.false_discovery_control(gene_pvalues, method="bh")
    
    # Calculate group mean normalized expression
    group_means = expression_long.groupby(["gene", "group"], as_index=False)["value"].mean()
    mean_summary = group_means.pivot(index="gene", columns="group", values="value").reset_index()
    # Assuming the groups are named "Control" and "Treatment", calculate fold change
    mean_summary["fc"] = mean_summary["Treatment"] - mean_summary["Control"]

    # Compile results
    gene_results = pd.DataFrame({"gene": genes, "pval": gene_pvalues, "padj": adjusted_pvalues})
    gene_results = gene_results.merge(mean_summary, on="gene")
    gene_results = gene_results.sort_values("pval")
    significant_genes = gene_results[gene_results["padj"] < alpha]

    return significant_genes

res = find_de_genes(df, alpha=0.05)
print(f"Number of significant genes: {len(res)}")
print("First few significant genes:")
print(res.head())
