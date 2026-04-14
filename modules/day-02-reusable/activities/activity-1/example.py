import matplotlib.pyplot as plt
import pandas as pd

# Refactored example for the repeated per-tissue correlation workflow.
# This version keeps the same analysis but makes the target gene and
# correlation threshold easy to change at the top of the script.

##### Helper functions for the workflow ----
def extract_target_correlations(expression_data, target_gene):
    # Extract one tissue's correlations with the selected target gene.
    expression_matrix = expression_data.set_index("Gene")
    correlation_matrix = expression_matrix.T.corr()
    correlation_with_target = correlation_matrix[target_gene].copy()
    correlation_with_target.index.name = "Gene"

    return correlation_with_target


def plot_gene_expression(tissue_expression, gene_list):
    # Plot the expression of selected genes across tissues.
    tissue_expression_long = tissue_expression[
        tissue_expression["Gene"].isin(gene_list)
    ].melt(id_vars="Gene", var_name="Sample", value_name="Expression")

    fig, ax = plt.subplots()
    for gene_name, gene_expression in tissue_expression_long.groupby("Gene"):
        ax.plot(
            gene_expression["Sample"],
            gene_expression["Expression"],
            marker="o",
            label=gene_name,
        )

    ax.set_xlabel("Sample")
    ax.set_ylabel("Expression")
    ax.legend()
    return fig, ax


##### Set up parameters for the analysis ----
data_dir = "mock_data_3_tissues"
tissue_files = {
    "Adipose": "Adipose.csv",
    "Liver": "Liver.csv",
    "Muscle": "Muscle.csv",
}

target_gene = "LIF"
correlation_threshold = 0.5


##### Run the reusable workflow ----
# Read in the data file for each tissue.
expression_by_tissue = {}
for tissue_name in tissue_files:
    expression_by_tissue[tissue_name] = pd.read_csv(
        f"{data_dir}/{tissue_files[tissue_name]}"
    )

# Apply the correlation extraction function to each tissue's expression data.
target_gene_correlations = pd.DataFrame(
    {
        tissue_name: extract_target_correlations(tissue_expression, target_gene)
        for tissue_name, tissue_expression in expression_by_tissue.items()
    }
).reset_index(names="Gene")
target_gene_correlations = target_gene_correlations[
    target_gene_correlations["Gene"] != target_gene
]

# Find genes that are highly correlated with the target gene in all tissues.
shared_highly_correlated_genes = target_gene_correlations[
    (target_gene_correlations.drop(columns="Gene") > correlation_threshold).all(axis=1)
]
print(shared_highly_correlated_genes)

# Plot the expression of the shared highly correlated genes across tissues.
per_tissue_plots = {}
selected_genes = list(shared_highly_correlated_genes["Gene"]) + [target_gene]

for tissue_name in tissue_files:
    tissue_expression = expression_by_tissue[tissue_name]
    fig, ax = plot_gene_expression(tissue_expression, selected_genes)
    ax.set_title(f"Expression of Highly Correlated Genes in {tissue_name}")
    per_tissue_plots[tissue_name] = fig
