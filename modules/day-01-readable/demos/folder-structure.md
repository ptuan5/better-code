# Folder Structure Demo

## Demo Goal

Show that there is more than one good project layout, but every good layout makes navigation easier for a newcomer.

## Scenario

Use this setup for the live demo:

You have just joined a small biology lab as a new trainee. A collaborator sends you a project folder from a recent bird migration study and says:

> "Everything you need should be in there. The cleaned data is in there somewhere, and I think the latest figure is already made."

The collaborator is in meetings all afternoon, so you cannot ask follow-up questions right away. You need to figure out:

- where the raw data lives
- which script is probably the main one
- whether the figure file is a final result or just a draft
- what you should avoid editing by accident

The point of the demo is not that this folder is terrible. The point is that it creates hesitation. A newcomer has to stop and guess before they can do anything useful.

## Starting Example

Say that this is the folder you were sent:

```text
bird-study/
├─- analysis_new.py
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

Ask:

- If you opened this for the first time, what would you click first?
- What would you worry about breaking?
- Which files look active, and which ones only look recent?
- Which file names tell you purpose, and which ones only tell you they are newer, older, or maybe final?
- If you had five minutes before a lab meeting, what would you still be unable to answer confidently?

Before reorganizing anything, let learners name the risks they feel:

- outputs mixed with code
- status words like `new`, `revised`, and `old`
- no obvious place to start
- no distinction between active work and leftovers

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
- file names describe purpose instead of status words like `new`, `final`, or `revised`
- archival material is marked clearly instead of mixed into active work
- the top level tells a newcomer where to start

## Suggested Talking Point

There is no single perfect structure. The standard is whether another person can quickly answer three questions: where is the source data, where is the code, and where are the outputs? Good folder structure and good file names work together.

You can also close the demo with this framing:

"A good folder structure lowers the number of decisions a newcomer has to make before they even open a script."
