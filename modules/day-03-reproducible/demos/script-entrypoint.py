# Demo script for Day 3: turn the Day 2 correlation workflow into an executable script.

# %%
import matplotlib.pyplot as plt
import pandas as pd

from matplotlib.backends.backend_pdf import PdfPages
import argparse
from pathlib import Path

# %%
def extract_target_correlations(expression_data, target_gene, correlation_method="pearson"):
    expression_matrix = expression_data.set_index("Gene")
    correlation_matrix = expression_matrix.T.corr(method=correlation_method)
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

# %%
def run_analysis(data_dir, target_gene, correlation_threshold, correlation_method, output_dir):
    tissue_files = {
        "Adipose": "Adipose.csv",
        "Liver": "Liver.csv",
        "Muscle": "Muscle.csv",
    }

    output_dir.mkdir(parents=True, exist_ok=True)

    expression_by_tissue = {}
    for tissue_name, file_name in tissue_files.items():
        expression_by_tissue[tissue_name] = pd.read_csv(data_dir / file_name)

    target_gene_correlations = pd.DataFrame(
        {
            tissue_name: extract_target_correlations(
                tissue_expression,
                target_gene,
                correlation_method,
            )
            for tissue_name, tissue_expression in expression_by_tissue.items()
        }
    ).reset_index(names="Gene")
    target_gene_correlations = target_gene_correlations[
        target_gene_correlations["Gene"] != target_gene
    ]

    shared_highly_correlated_genes = target_gene_correlations[
        (target_gene_correlations.drop(columns="Gene") > correlation_threshold).all(axis=1)
    ]

    results_path = output_dir / "shared_highly_correlated_genes.csv"
    shared_highly_correlated_genes.to_csv(results_path, index=False)

    plot_path = output_dir / "shared_gene_expression.pdf"
    selected_genes = list(shared_highly_correlated_genes["Gene"]) + [target_gene]

    with PdfPages(plot_path) as pdf:
        for tissue_name, tissue_expression in expression_by_tissue.items():
            fig, ax = plot_gene_expression(tissue_expression, selected_genes)
            ax.set_title(f"Expression of Highly Correlated Genes in {tissue_name}")
            pdf.savefig(fig, bbox_inches="tight")
            plt.close(fig)

    return {
        "shared_highly_correlated_genes": shared_highly_correlated_genes,
        "results_path": results_path,
        "plot_path": plot_path,
    }

# %%
def main():
    script_dir = Path(__file__).resolve().parent

    parser = argparse.ArgumentParser(
        description="Run the shared gene-correlation workflow and save CSV/PDF outputs."
    )
    parser.add_argument(
        "--data-dir",
        default=str(script_dir / "../../day-02-reusable/activities/activity-1/mock_data_3_tissues"),
    )
    parser.add_argument("--target-gene", default="LIF")
    parser.add_argument("--correlation-threshold", type=float, default=0.5)
    parser.add_argument("--correlation-method", default="pearson")
    parser.add_argument("--output-dir", default=str(script_dir / "results"))

    args = parser.parse_args()

    analysis_results = run_analysis(
        data_dir=Path(args.data_dir),
        target_gene=args.target_gene,
        correlation_threshold=args.correlation_threshold,
        correlation_method=args.correlation_method,
        output_dir=Path(args.output_dir),
    )

    print(f"Target gene: {args.target_gene}")
    print(f"Correlation threshold: {args.correlation_threshold}")
    print(f"Correlation method: {args.correlation_method}")
    print(f"Saved shared genes to: {analysis_results['results_path']}")
    print(f"Saved plots to: {analysis_results['plot_path']}")
    print("Done")

# %%
if __name__ == "__main__":
    main()
