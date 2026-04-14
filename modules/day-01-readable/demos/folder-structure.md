# Folder Structure Demo

## Demo Goal

Show that even a small amount of clutter can make a project harder to scan, and that parent folder names can add useful meaning.

## Scenario

You inherit a project from a lab alumnus, which contains analysis for two months of data. You have extra data for another month and want to continue the analysis.
The professor points you toward the root directory, with the content as shown below.

```text
bird-study/
|-- analysis_new.py
|-- cleaned.csv
|-- fig1.png
|-- fig1_revised.png
|-- fig1_revised_final.png
|-- final_notes.txt
|-- helper.R
|-- raw_april.csv
|-- raw_may.csv
|-- run_this.py
`-- stuff_old/
    `-- test_plot.py
```

How do you navigate next?

- Which file would you open first?
- Which file looks like an input, which one looks like code, and which one looks like output?
- What clarification would you ask the PI regarding these files?
- How would you reorganize it?

The point of the demo is not to overwhelm learners. It is to show how a small project can still slow a newcomer down when inputs, scripts, and outputs are not grouped meaningfully.

## Option A: Organize by Artifact Type

```text
bird-study/
|-- README.md
|-- archive/
│   `-- test_plot.py
|-- data/
│   |-- cleaned/
│   │   `-- cleaned.csv
│   `-- raw/
│       |-- raw_april.csv
│       `-- raw_may.csv
|-- docs/
│   `-- final_notes.txt
|-- results/
│   `-- figures/
│       |-- fig1.png
│       |-- fig1_revised_final.png
│       `-- fig1_revised.png
`-- scripts/
    |-- analysis_new.py
    |-- helper.R
    `-- run_this.py
```

## Option B: Organize by Workflow Stage

```text
bird-study/
|-- README.md
|-- 01-raw-data/
│   |-- raw_april.csv
│   `-- raw_may.csv
|-- 02-cleaning/
│   |-- analysis_new.py
│   |-- cleaned.csv
│   `-- helper.R
|-- 03-analysis/
│   `-- run_this.py
|-- 04-figures/
│   |-- fig1.png
│   |-- fig1_revised_final.png
│   `-- fig1_revised.png
|-- 05-notes/
│   `-- final_notes.txt
`-- archive/
    `-- test_plot.py
```
