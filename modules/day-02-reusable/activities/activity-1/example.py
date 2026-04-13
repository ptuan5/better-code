from functools import reduce
from pathlib import Path

import matplotlib.pyplot as plt
import pandas as pd


# Refactored example for the repeated per-tissue correlation workflow.
# This version keeps the same analysis but makes the target gene and
# correlation threshold easy to change at the top of the script.
data_dir = Path("modules/day-02-reusable/activities/activity-1/mock_data_3_tissues")
tissue_files = {
    "Adipose": "Adipose.csv",
    "Liver": "Liver.csv",
    "Muscle": "Muscle.csv",
}

target_gene = "LIF"
correlation_threshold = 0.5


def load_expression_data(data_dir, tissue_files):
    """Load each tissue-specific expression table into a named dictionary."""
    return {
        tissue_name: pd.read_csv(data_dir / file_name)
        for tissue_name, file_name in tissue_files.items()
    }


def extract_target_correlations(expression_data, tissue_name, target_gene):
    """Extract one tissue's correlations with the selected target gene."""
    expression_data = expression_data.set_index("Gene")
    sample_columns = [column for column in expression_data.columns if column != "Gene"]
    correlation_matrix = expression_data[sample_columns].T.corr()

    return pd.DataFrame(
        {
            "Gene": correlation_matrix.index,
            tissue_name: correlation_matrix[target_gene].values,
        }
    )


def find_shared_high_correlation_genes(correlation_tables, target_gene, correlation_threshold):
    """Keep only the genes that stay above the correlation threshold in all tissues."""
    combined_correlations = reduce(
        lambda left_table, right_table: left_table.merge(right_table, on="Gene"),
        correlation_tables,
    )
    combined_correlations = combined_correlations[
        combined_correlations["Gene"] != target_gene
    ]

    tissue_columns = [column for column in combined_correlations.columns if column != "Gene"]
    return combined_correlations[
        (combined_correlations[tissue_columns] > correlation_threshold).all(axis=1)
    ]


def plot_shared_gene_expression(expression_by_tissue, shared_gene_table, target_gene):
    """Build one plot per tissue for the target gene and shared high-correlation genes."""
    genes_to_plot = list(shared_gene_table["Gene"]) + [target_gene]
    per_tissue_plots = {}

    for tissue_name, tissue_expression in expression_by_tissue.items():
        tissue_expression_long = tissue_expression[
            tissue_expression["Gene"].isin(genes_to_plot)
        ].melt(id_vars="Gene", var_name="Sample", value_name="Expression")

        fig, ax = plt.subplots()
        for gene_name, gene_expression in tissue_expression_long.groupby("Gene"):
            ax.plot(
                gene_expression["Sample"],
                gene_expression["Expression"],
                marker="o",
                label=gene_name,
            )

        ax.set_title(f"Expression of Highly Correlated Genes in {tissue_name} Tissue")
        ax.set_xlabel("Sample")
        ax.set_ylabel("Expression")
        ax.legend()
        per_tissue_plots[tissue_name] = fig

    return per_tissue_plots


# Run the reusable workflow.
expression_by_tissue = load_expression_data(data_dir, tissue_files)

target_gene_correlations = [
    extract_target_correlations(expression_by_tissue[tissue_name], tissue_name, target_gene)
    for tissue_name in expression_by_tissue
]

shared_highly_correlated_genes = find_shared_high_correlation_genes(
    target_gene_correlations,
    target_gene,
    correlation_threshold,
)
print(shared_highly_correlated_genes)

per_tissue_plots = plot_shared_gene_expression(
    expression_by_tissue,
    shared_highly_correlated_genes,
    target_gene,
)
