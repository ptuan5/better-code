# Activity 1: Organize a Repo

## Scenario

A collaborator hands you this project folder and says, "Everything should be here."

```text
lake-survey/
├── 2023final.csv
├── a.py
├── comments.txt
├── fig_final2.png
├── fig_final_REALLY.png
├── helpers.R
├── june_raw.csv
├── may_raw.csv
├── notes_old.txt
├── run_me.py
├── temp.csv
└── old/
    └── plot_test.py
```

## Your Task

Reorganize the directory on paper or in discussion. You do not need to agree on one perfect answer.

1. Create a clearer folder structure.
2. Rename the most confusing files.
3. Decide what belongs in active work versus `archive/`.
4. Draft a 2-3 sentence `README.md` note explaining where someone should start.

## Constraints

- Keep all raw data files.
- Do not change the scientific content.
- Aim for a structure a labmate could understand in under a minute.

## Debrief Prompt

Be ready to explain:

- one naming change that improved clarity
- one file you would archive and why
- one thing that still feels subjective

## Facilitator Reference

One reasonable answer could include:

- `data/raw/` for `may_raw.csv` and `june_raw.csv`
- `data/processed/` for `2023final.csv`
- `scripts/` for `a.py`, `run_me.py`, and `helpers.R` after renaming them
- `results/figures/` for the figure files
- `docs/` for project notes
- `archive/` for `old/plot_test.py`, `notes_old.txt`, or other superseded files
