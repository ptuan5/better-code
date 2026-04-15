# Activity 1: Create a Conda Environment

## Goal

Create a conda environment from a starter environment file, install the missing packages, and explain what the main environment files are doing.

## Scenario

You have several projects in different languages, and many of them share common packages. You want one environment that contains the packages you use most often.

Your task is to create a conda environment from the starter file, identify which packages are missing, install them, and explain which environment file should be shared.

Note: this environment is meant to support Demo 2 and Activity 2 later in Day 3.

## Files

- starter environment: `starter_environment.yml`
- testing scripts: `check_environment.py` and `check_environment.R`

### Suggested Instructions

Inspect the starter files and create the environment they describe.

1. Install [conda-forge](https://conda-forge.org/download/), if you don't have it already.
2. Read `starter_environment.yml`.
4. Create the conda environment and activate the environment.
6. Run `python check_environment.py` and `Rscript check_environment.R` to
   see which packages are still missing.
7. Add the missing packages, rerun the checks, and confirm that both scripts pass.
8. Export the new requirement file.

### What to Look For

- the environment name
- where conda should search for packages
- which Python and R packages will be installed
- which packages are missing from the starter file
- which later starter scripts those packages support
- which files describe an environment versus which folders get created locally

## Discussion Prompt

- what did `starter_environment.yml` make explicit?
- what did `renv.lock` communicate differently?
- what did `pyproject.toml` communicate differently?
- what part of environment setup still feels easiest to forget?
- what would still confuse a new lab member trying to recreate the setup?
