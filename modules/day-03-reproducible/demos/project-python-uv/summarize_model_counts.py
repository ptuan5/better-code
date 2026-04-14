from pathlib import Path

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


def summarize_model_counts(data, start_year="2021", end_year="2023"):
    prepared = data.copy()
    prepared["created"] = pd.to_datetime(prepared["created"], format="%m/%d/%Y")
    prepared["year"] = prepared["created"].dt.strftime("%Y")
    filtered = prepared[
        (prepared["year"] >= start_year) & (prepared["year"] <= end_year)
    ]
    return (
        filtered.groupby(["year", "model"])
        .size()
        .reset_index(name="n")
        .sort_values(["year", "model"])
        .reset_index(drop=True)
    )


def write_results(result_table, output_file):
    output_path = Path(output_file)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    result_table.to_csv(output_path, index=False)


def main():
    result_table = summarize_model_counts(gene_set_uploads)
    output_file = "results/model_counts.csv"
    write_results(result_table, output_file)
    print(f"Saved results to {output_file}")


if __name__ == "__main__":
    main()
