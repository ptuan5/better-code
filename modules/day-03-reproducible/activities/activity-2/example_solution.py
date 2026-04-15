#!/usr/bin/env python3
"""
Command-line tool to generate stacked bar plots of gene set uploads over time.

This script:
- Reads a CSV file containing gene set metadata
- Filters data by a specified year range
- Computes yearly and cumulative counts by experimental model
- Generates stacked bar plots
- Saves the plots to a multi-page PDF

Usage:
    python script.py --path <dir> --file <file.csv> --output <out.pdf>

Notes:
  - Expected columns in the input CSV: 'search_text', 'created', 'model'
  - The 'created' column should be in MM/DD/YYYY format
  - The script filters data between a start and end year
  - Output is a multi-page PDF containing:
      1) Cumulative counts by model
      2) Yearly counts by model
"""
import argparse
import os
from pathlib import Path

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

def main():
    parser = argparse.ArgumentParser(description="Run the starter plotting workflow from the command line.")
    parser.add_argument("--path", required=True, help="Directory containing the input CSV file.")
    parser.add_argument("--file", required=True, help="Input CSV filename.")
    parser.add_argument("--output", required=True, help="Path to the output PDF file.")
    parser.add_argument("--start_year", type=int, default=2015, help="Start year for the plot range.")
    parser.add_argument("--end_year", type=int, default=2025, help="End year for the plot range.")

    args = parser.parse_args()

    # Validate inputs
    if args.end_year < args.start_year:
        raise ValueError("--end_year must be greater than or equal to --start_year.")

    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    # Main analysis
    plot_list = create_plots(args.path, args.file, args.start_year, args.end_year)

    # Save plots to PDF
    with PdfPages(output_path) as pdf:
        for figure in plot_list:
            pdf.savefig(figure)
            plt.close(figure)

if __name__ == "__main__":
    main()
