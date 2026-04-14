# Adopted from the R script written by Tessa Nichols-Meade
# 01-20-2026
# Bar charts by Experimental Model over a range of years

# Explanation of inputs to create_plots function

# "path": the complete path to the spreadsheet being used to generate graphs (e.g."C:/User/Opioid")
# "file": the name of the file (i.e. spreadsheet) used to generate graphs (e.g."master_list.csv")
# "start_year": the start of the year range
# "end_year": the end of the year range

import os
import pandas as pd
import matplotlib.pyplot as plt


def create_plots(path, file, start_year, end_year):
    os.chdir(path)

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

    cumulative_plot = cumulative_plot_data.plot(kind="bar", stacked=True, title=cum_title)
    count_plot = count_plot_data.plot(kind="bar", stacked=True, title=count_title)

    cumulative_plot.set_xlabel("Year")
    cumulative_plot.set_ylabel("Cumulative Count")
    count_plot.set_xlabel("Year")
    count_plot.set_ylabel("Count")

    plt.show()

    return [cumulative_plot, count_plot]


create_plots("mock_data", "MasterOpioid.csv", 2015, 2025)
