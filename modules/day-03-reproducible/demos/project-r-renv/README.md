# R `renv` Project

This folder shows one small way to package an R script so another person can restore the project library and run it.

## Runtime

- R 4.5.0

## Files

- `summarize_model_counts.R`: analysis script
- `renv.lock`: project package requirements
- `.gitignore`: files and folders to keep out of version control

## Set Up

From this folder, run:

```bash
Rscript -e "install.packages('renv', repos = 'https://cloud.r-project.org')"
Rscript -e "renv::restore(prompt = FALSE)"
```

## Run

```bash
Rscript summarize_model_counts.R
```

## Output

The script writes `results/model_counts.csv`.
