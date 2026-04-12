# Activity 1: Organize a Repo

## Goal

Reorganize a messy project folder so a newcomer can tell where the inputs, active scripts, and outputs belong.

## Scenario

You received a project folder from a mouse glial transcriptomics study, which contains processing code and some results. 

**Study Outline**: Male C57BL6/J mice were subjected to 14 days of chronic unpredictable stress (CUS) or were left unstressed. Following this, the brains (frontal cortex) were rapidly extracted. Two glial cell types were isolated from these samples, astrocytes and microglia, using fluorescence activated cell sorting (FACS). RNA was extracted from these samples and sequenced.

**Processes Done**: 
- Inspect sequencing quality control
- Mapping to Reference Genome
- Quantify Gene Expression & Differential Expression Analysis 
- Quantify Splicing Events & Differential Splicing Analysis

Here is the project you receive

```text
CUS-glial-transcriptomics/
|-- alignment_rate.png       : a plot summarizing the mapping process 
|-- Ast_PSI_all.txt          : output of differential splicing analysis for astrocytes
|-- AstroGenes.csv           : output of gene quantification, input of differential expression analysis for astrocytes
|-- CUS_DEG_Mice.R           : code for differential gene analysis
|-- DEG_Astro.csv            : output of differential expression analysis for astrocytes
|-- DEG_Micro.csv            : output of differential expression analysis for microglia
|-- Pipeline.Rmd             : code for preprocessing (quality control, mapping, quantification)
|-- metadata.csv             : table matching sample ID to its description
|-- Mic_PSI_all.txt          : output of differential splicing analysis for microglia
|-- MicroGenes.csv           : output of gene quantification, input of differential expresison analysis for microglia
|-- multiqc_report.html      : plots summarizing the sequencing quality control
|-- Rplot01.png              : a plot summarizing the differential expresison analysis (volcano)
|-- Rplot02.png              : a plot showing example of an alternate splicing event (sashimi plot)
`-- Visualize_rMATS_PSI.R    : code for differential splicing analysis visualization
```

## Prompt

Reorganize the directory on paper or in discussion. You do not need to agree on one perfect answer.

1. Create a clearer folder structure.
2. Decide which files belong together and what the parent folders should communicate.
3. Reorganize the files so the structure is easier to scan, rename them if necessary.
4. Be ready to explain one tradeoff you made.

## Constraints

- Keep all files from the starting example. 
- Do not invent new analysis outputs or delete anything.
- Aim for a structure a labmate could understand in under a minute.
- Use parent folder names to add information when that helps.

## Debrief Prompt

Be ready to explain:

- one grouping choice that made the project easier to scan
- one parent folder name that added useful information
- one place where another team might still make a different but reasonable choice

## After You Try It

If you want a worked example after the discussion, open [example-organization.md](/Users/nguyetu/Documents/Trainee/DS Fellow/BetterCode/modules/day-01-readable/activities/activity-1/example-organization.md).
