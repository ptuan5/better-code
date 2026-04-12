# Activity 1 Example Organization

Look at this only after learners have proposed their own structure.

The prompt allows renaming if that helps clarity. The examples below keep the same files, but in Option B a few script and figure names are made more descriptive.

## Option A: Organize by Artifact Type

```text
CUS-glial-transcriptomics/
|-- data-analysis-inputs/
│   |-- AstroGenes.csv
│   |-- MicroGenes.csv
│   `-- metadata.csv
|-- results
│   |-- Ast_PSI_all.txt    
│   |-- Mic_PSI_all.txt
│   |-- DEG_Astro.csv
│   `-- DEG_Micro.csv
|-- reports-and-figures/
│   |-- alignment_rate.png
│   |-- multiqc_report.html
│   |-- Rplot01.png --> volcano-plot.png
│   `-- Rplot02.png --> sashimi-plot.png
`-- scripts/
    |-- CUS_DEG_Mice.R
    |-- Pipeline.Rmd
    `-- Visualize_rMATS_PSI.R
```

Why this works:

- data and scripts are separated
- QC and figure outputs are grouped together instead of mixed with tables
- a newcomer can quickly identify metadata, analysis inputs, scripts, and results

## Option B: Organize by Workflow Stage

This version uses a few clearer names for the code and figure files.

```text
CUS-glial-transcriptomics/
|-- 01-study-design/
│   `-- metadata.csv
|-- 02-preprocessing-pipeline/
│   |-- alignment_rate.png
│   |-- multiqc-report.html
│   |-- AstroGenes.csv
│   |-- MicroGenes.csv
│   `-- Pipeline --> preprocessing-pipeline.Rmd
|-- 03-differential-expression/
|   |-- CUS_DEG_Mice.R
|   |-- Rplot01.png --> volcano-plot.png
│   |-- DEG_Astro.csv
│   `-- DEG_Micro.csv
`-- 04-differential-splicing-and-figures/
    |-- Ast_PSI_all.txt    
    |-- Mic_PSI_all.txt
    |-- Rplot02.png --> example-sashimi-plot.png
    `-- Visualize_rMATS_PSI.R
```

Why this works:

- the folder order suggests a workflow
- a newcomer can infer the order of what happened before opening any code
