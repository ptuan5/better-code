import os

import pandas as pd

gene_set_uploads = pd.DataFrame(
    {
        "created": [
            "01/10/2021",
            "03/15/2021",
            "07/02/2022",
            "04/21/2022",
            "08/08/2023",
            "09/14/2023",
        ],
        "model": ["mouse", "cell line", "mouse", "human", "human", "mouse"],
        "search_text": ["opioid", "opioid", "opioid", "opioid", "opioid", "opioid"],
    }
)


def build_model_counts(path=".", start_year="2021", end_year="2023"):
    os.chdir(path)

    x = gene_set_uploads.copy()
    x["created"] = pd.to_datetime(x["created"], format="%m/%d/%Y")
    x["created"] = x["created"].dt.strftime("%Y")
    y = x[(x["created"] >= start_year) & (x["created"] <= end_year)]
    z = y.groupby(["created", "model"]).size().reset_index(name="n")

    z.to_csv("model_counts.csv", index=False)
    print(z)


build_model_counts(".")
