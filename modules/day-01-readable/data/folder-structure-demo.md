# Folder Structure Demo

## Demo Goal

Show that there is more than one good project layout, but every good layout makes navigation easier for a newcomer.

## Starting Example

Use this as the "before" directory in the demo:

```text
bird-study/
├── analysis_new.py
├── cleaned.csv
├── fig1.png
├── fig1_revised.png
├── final_notes.txt
├── helper.R
├── raw_april.csv
├── raw_may.csv
├── run_this.py
└── stuff_old/
    └── test_plot.py
```

Ask: "If you opened this for the first time, what would you click first? What would you worry about breaking?"

## Option A: Organize by Artifact Type

```text
bird-study/
├── README.md
├── data/
│   ├── processed/
│   │   └── cleaned.csv
│   └── raw/
│       ├── raw_april.csv
│       └── raw_may.csv
├── docs/
│   └── final_notes.txt
├── results/
│   └── figures/
│       ├── fig1.png
│       └── fig1_revised.png
├── scripts/
│   ├── clean_data.py
│   ├── helper.R
│   └── run_analysis.py
└── archive/
    └── test_plot.py
```

When this works well:

- small to medium projects
- mixed analysis outputs
- teams that want stable, familiar folder names

## Option B: Organize by Workflow Stage

```text
bird-study/
├── README.md
├── 01-raw-data/
│   ├── raw_april.csv
│   └── raw_may.csv
├── 02-cleaning/
│   ├── clean_data.py
│   └── cleaned.csv
├── 03-analysis/
│   ├── helper.R
│   └── run_analysis.py
├── 04-figures/
│   ├── fig1.png
│   └── fig1_revised.png
├── notes/
│   └── final_notes.txt
└── archive/
    └── test_plot.py
```

When this works well:

- projects with a clear sequence of steps
- teaching settings where you want execution order to be visible
- teams that think in terms of pipeline stages

## What Both Versions Improve

- raw data is easy to find and less likely to be edited accidentally
- scripts are separated from outputs
- file names describe purpose instead of status
- archival material is marked clearly instead of mixed into active work
- the top level tells a newcomer where to start

## Suggested Talking Point

There is no single perfect structure. The standard is whether another person can quickly answer three questions: where is the source data, where is the code, and where are the outputs?
