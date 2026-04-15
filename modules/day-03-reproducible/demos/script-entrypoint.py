#!/usr/bin/env python

"""
script-entrypoint.py

This script:
- Loads gene expression data from multiple tissues
- Computes correlations with a target gene
- Identifies genes consistently highly correlated across tissues
- Exports results to CSV
- Saves expression plots to a multi-page PDF

Usage:
    python script.py --data_dir <path> --target_gene <gene> --output_dir <path>
"""
# Demo script for Day 3: turn the Day 2 correlation workflow into an executable script.

import argparse
from pathlib import Path

import matplotlib.pyplot as plt
import pandas as pd
from matplotlib.backends.backend_pdf import PdfPages


def extract_target_correlations(expression_data, target_gene):
    expression_matrix = expression_data.set_index("Gene")
    correlation_matrix = expression_matrix.T.corr()
    correlation_with_target = correlation_matrix[target_gene].copy()
    correlation_with_target.index.name = "Gene"
    return correlation_with_target


def plot_gene_expression(tissue_expression, gene_list):
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

def run_analysis(data_dir, target_gene, output_dir, correlation_threshold):
    tissue_files = {
        "Adipose": "Adipose.csv",
        "Liver": "Liver.csv",
        "Muscle": "Muscle.csv",
    }

    # Load and process data
    expression_by_tissue = {}
    for tissue_name, file_name in tissue_files.items():
        expression_by_tissue[tissue_name] = pd.read_csv(data_dir / file_name)

    target_gene_correlations = pd.DataFrame(
        {
            tissue_name: extract_target_correlations(tissue_expression, target_gene)
            for tissue_name, tissue_expression in expression_by_tissue.items()
        }
    ).reset_index(names="Gene")
    target_gene_correlations = target_gene_correlations[
        target_gene_correlations["Gene"] != target_gene
    ]

    shared_highly_correlated_genes = target_gene_correlations[
        (target_gene_correlations.drop(columns="Gene") > correlation_threshold).all(axis=1)
    ]

    shared_highly_correlated_genes.to_csv(
        output_dir / "shared_highly_correlated_genes.csv",
        index=False,
    )

    per_tissue_plots = {}
    selected_genes = list(shared_highly_correlated_genes["Gene"]) + [target_gene]

    for tissue_name, tissue_expression in expression_by_tissue.items():
        fig, ax = plot_gene_expression(tissue_expression, selected_genes)
        ax.set_title(f"Expression of Highly Correlated Genes in {tissue_name}")
        per_tissue_plots[tissue_name] = fig

    with PdfPages(output_dir / "per_tissue_expression_plots.pdf") as pdf:
        for figure in per_tissue_plots.values():
            pdf.savefig(figure, bbox_inches="tight")
            plt.close(figure)


def main():
    parser = argparse.ArgumentParser(description="Find genes correlated with a target gene across tissues and plot their expressions.")
    parser.add_argument("--data_dir", required=True, help="Directory containing tissue CSV files")
    parser.add_argument("--target_gene", required=True, help="Target gene for correlation analysis.")
    parser.add_argument("--output_dir", required=True, help="Directory to write output files.")
    parser.add_argument("--correlation_threshold", type=float, default=0.5, help="Correlation threshold.")

    args = parser.parse_args()

    data_dir = Path(args.data_dir)
    target_gene = args.target_gene
    correlation_threshold = args.correlation_threshold
    output_dir = Path(args.output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    run_analysis(data_dir, target_gene, output_dir, correlation_threshold)

if __name__ == "__main__":
    main()
