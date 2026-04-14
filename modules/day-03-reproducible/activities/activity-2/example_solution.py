"""Executable version of starter.py with CLI flags for all create_plots inputs."""

import argparse
import os
from pathlib import Path

import matplotlib

matplotlib.use("Agg")

import matplotlib.pyplot as plt
import pandas as pd
from matplotlib.backends.backend_pdf import PdfPages


def create_plots(path, file, start_year, end_year):
    original_cwd = Path.cwd()
    os.chdir(path)
    try:
        readfile = pd.read_csv(file)
        allyears = pd.DataFrame(readfile)

        if (allyears["search_text"] == "opioid").any():
            drug = "Opioid"
        elif (allyears["search_text"] == "cocaine").any():
            drug = "Cocaine"
        elif (allyears["search_text"] == "alcohol").any():
            drug = "Alcohol"
        else:
            drug = "Unknown"

        allyears["created"] = pd.to_datetime(allyears["created"], format="%m/%d/%Y")
        allyears["created"] = allyears["created"].dt.strftime("%Y")

        recentyears = allyears[allyears["created"] >= str(start_year)]

        model_recent = recentyears["model"].unique()
        years = [str(year) for year in range(start_year, end_year + 1)]

        cumulative_data = (
            recentyears.groupby(["created", "model"])
            .size()
            .reset_index(name="n")
            .sort_values("created")
        )

        all_grid = pd.MultiIndex.from_product(
            [model_recent, years], names=["model", "created"]
        ).to_frame(index=False)

        counts_complete = all_grid.merge(cumulative_data, on=["created", "model"], how="left")
        counts_complete["n"] = counts_complete["n"].fillna(0).astype(int)
        counts_complete["Cumulative_Count"] = counts_complete.groupby("model")["n"].cumsum()

        cum_title = (
            f"Cumulative Number of {drug} Genesets Uploaded by Experimental Model: "
            f"{start_year}-{end_year}"
        )
        count_title = (
            f"Number of {drug} Genesets Uploaded by Experimental Model: "
            f"{start_year}-{end_year}"
        )

        cumulative_plot_data = counts_complete.pivot(
            index="created", columns="model", values="Cumulative_Count"
        ).fillna(0)
        count_plot_data = counts_complete.pivot(
            index="created", columns="model", values="n"
        ).fillna(0)

        cumulative_figure, cumulative_axis = plt.subplots(figsize=(10, 6))
        cumulative_plot_data.plot(kind="bar", stacked=True, title=cum_title, ax=cumulative_axis)
        cumulative_axis.set_xlabel("Year")
        cumulative_axis.set_ylabel("Cumulative Count")
        cumulative_figure.tight_layout()

        count_figure, count_axis = plt.subplots(figsize=(10, 6))
        count_plot_data.plot(kind="bar", stacked=True, title=count_title, ax=count_axis)
        count_axis.set_xlabel("Year")
        count_axis.set_ylabel("Count")
        count_figure.tight_layout()

        return [cumulative_figure, count_figure]
    finally:
        os.chdir(original_cwd)


def save_plots_to_pdf(plot_list, output_path):
    output_path.parent.mkdir(parents=True, exist_ok=True)

    with PdfPages(output_path) as pdf:
        for figure in plot_list:
            pdf.savefig(figure)
            plt.close(figure)


def main():
    parser = argparse.ArgumentParser(
        description="Run the starter plotting workflow with CLI arguments."
    )
    parser.add_argument("--path", required=True, help="Directory containing the input CSV file.")
    parser.add_argument("--file", required=True, help="Input CSV filename.")
    parser.add_argument("--start-year", type=int, required=True, help="Start year for the plot range.")
    parser.add_argument("--end-year", type=int, required=True, help="End year for the plot range.")
    parser.add_argument("--output", required=True, help="Path to the output PDF file.")
    args = parser.parse_args()

    input_dir = Path(args.path).resolve()
    input_file = args.file
    input_path = input_dir / input_file

    if not input_path.exists():
        raise FileNotFoundError(f"Input file not found: {input_path}")

    output_path = Path(args.output).resolve()
    plot_list = create_plots(str(input_dir), input_file, args.start_year, args.end_year)
    save_plots_to_pdf(plot_list, output_path)

    print(f"Input directory: {input_dir}")
    print(f"Input file: {input_file}")
    print(f"Start year: {args.start_year}")
    print(f"End year: {args.end_year}")
    print(f"Saved plots to: {output_path}")
    print("Done")


if __name__ == "__main__":
    main()
