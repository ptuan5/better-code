# Activity 1: Organize a Repo

## Scenario

A collaborator hands you this transcriptomics project folder and says, "Everything should be here."

```text
lincRNA-project/
├── all_counts_FINAL.csv
├── brain_area_colors.csv
├── description_new.csv
├── figure2_final.png
├── figure2_final_v3.png
├── linc2.RData
├── pca_try.R
├── pca_try_old.R
├── readme_notes.txt
├── rlog_transformed.rds
├── sample_table.csv
├── temp_plot.pdf
└── old/
    ├── run_before_meeting.R
    └── weird_copy_of_counts.csv
```

This scenario is inspired by the kinds of files mixed together in `example_code/lincRNA_2.R`.

This activity starts the week by making project structure legible. The clearer this project becomes today, the easier it is to talk about reuse, reproducibility, reliability, and sharing later.

## Your Task

Reorganize the directory on paper or in discussion. You do not need to agree on one perfect answer.

1. Create a clearer folder structure.
2. Rename the most confusing files.
3. Decide what belongs in active work versus `archive/`.
4. Draft a 2-3 sentence `README.md` note explaining where someone should start.

## Constraints

- Keep all raw and transformed data files.
- Do not change the scientific content.
- Aim for a structure a labmate could understand in under a minute.
- Assume a new person will need to tell raw inputs, metadata, scripts, and results apart quickly.

## Debrief Prompt

Be ready to explain:

- one naming change that improved clarity
- one file you would archive and why
- one thing that still feels subjective
- one file that should probably not live at the project top level

## Facilitator Reference

One reasonable answer could include:

- `data/raw/` for count tables and sample sheets
- `data/processed/` for `rlog_transformed.rds` and other intermediate objects
- `scripts/` for active analysis scripts after renaming them
- `results/figures/` for PNG and PDF outputs
- `docs/` for project notes
- `archive/` for superseded scripts, duplicate files, or old exploratory outputs
