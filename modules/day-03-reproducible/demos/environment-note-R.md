# R Project with `renv`

## Demo Goal

Show how a small R project records package requirements with `renv` and gives a collaborator a restore command instead of a vague reminder to "install dplyr."

## Project Folder

- `project-r-renv/README.md`
- `project-r-renv/renv.lock`
- `project-r-renv/summarize_model_counts.R`

## What to Notice

- the analysis script lives beside the environment file
- `renv.lock` records the package requirement for the project
- the README gives the restore command and the run command
- the local package library is not something you would commit to the repo

## Setup Flow

From `demos/project-r-renv/`, a collaborator should be able to:

```bash
Rscript -e "install.packages('renv', repos = 'https://cloud.r-project.org')"
Rscript -e "renv::restore(prompt = FALSE)"
Rscript summarize_model_counts.R
```

## Suggested Talking Points

- `renv` makes the project library explicit instead of relying on whatever is already installed.
- `renv.lock` is the important file to share; the library itself is machine-local.
- Compared with conda, `renv` lives much closer to the R project itself.
- The goal is not a long setup guide. It is a short project folder that gives the next person a reliable starting point.
