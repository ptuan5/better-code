import matplotlib.pyplot as plt
import pandas as pd

adipose_expression = pd.read_csv("mock_data_3_tissues/Adipose.csv")
liver_expression = pd.read_csv("mock_data_3_tissues/Liver.csv")
muscle_expression = pd.read_csv("mock_data_3_tissues/Muscle.csv")

lif_corr = {}

# Find genes correlated with gene of interest in adipose
adipose_expression.index = adipose_expression["Gene"]
cor_matrix = adipose_expression.iloc[:, 1:10].T.corr()
cor_gene = cor_matrix["LIF"]

lif_corr["Adipose"] = pd.DataFrame(
    {
        "Gene": cor_matrix.index,
        "Adipose": cor_gene.values,
    }
)

# Find genes correlated with gene of interest in liver
liver_expression.index = liver_expression["Gene"]
cor_matrix = liver_expression.iloc[:, 1:10].T.corr()
cor_gene = cor_matrix["LIF"]

lif_corr["Liver"] = pd.DataFrame(
    {
        "Gene": cor_matrix.index,
        "Liver": cor_gene.values,
    }
)

# Find genes correlated with gene of interest in muscle
muscle_expression.index = muscle_expression["Gene"]
cor_matrix = muscle_expression.iloc[:, 1:10].T.corr()
cor_gene = cor_matrix["LIF"]

lif_corr["Muscle"] = pd.DataFrame(
    {
        "Gene": cor_matrix.index,
        "Muscle": cor_gene.values,
    }
)

# Merge the per-tissue correlation summaries into one table
combined_correlations = lif_corr["Adipose"].merge(lif_corr["Liver"], on="Gene").merge(
    lif_corr["Muscle"], on="Gene"
)
combined_correlations = combined_correlations[combined_correlations["Gene"] != "LIF"]

# Find genes that are highly correlated with LIF in all 3 tissues
shared_highly_correlated_genes = combined_correlations[
    (combined_correlations["Adipose"] > 0.5)
    & (combined_correlations["Liver"] > 0.5)
    & (combined_correlations["Muscle"] > 0.5)
]
print(shared_highly_correlated_genes)

# Plot the expression of the target genes and the correlated genes for each tissue
expression_by_tissue = {
    "Adipose": adipose_expression,
    "Liver": liver_expression,
    "Muscle": muscle_expression,
}
per_tissue_plots = {}

for tissue in ["Adipose", "Liver", "Muscle"]:
    tissue_expression = expression_by_tissue[tissue]
    tissue_expression_long = tissue_expression[
        tissue_expression["Gene"].isin(list(shared_highly_correlated_genes["Gene"]) + ["LIF"])
    ].melt(id_vars="Gene", var_name="Sample", value_name="Expression")

    fig, ax = plt.subplots()
    for gene_name, gene_expression in tissue_expression_long.groupby("Gene"):
        ax.plot(
            gene_expression["Sample"],
            gene_expression["Expression"],
            marker="o",
            label=gene_name,
        )

    ax.set_title(f"Expression of Highly Correlated Genes in {tissue} Tissue")
    ax.set_xlabel("Sample")
    ax.set_ylabel("Expression")
    ax.legend()
    per_tissue_plots[tissue] = fig

# %%
