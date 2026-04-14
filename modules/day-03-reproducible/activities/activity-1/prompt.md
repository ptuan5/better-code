# Activity 1: Create a Conda Environment

## Goal

Create a conda environment from an `environment.yml` file and explain what the main environment files are doing.

## Scenario

Picture receiving two small project folders from collaborators. One uses `renv` for R. One uses `uv` for Python. Before you even worry about the scripts, you need to understand how the environment is supposed to be recreated.

Your task is to create a conda environment from a starter file, verify that it works, and compare that file with the `renv` and `uv` project files from the demo.

This activity is about setup rather than script structure. The goal is to make environment assumptions visible before we move on to executable scripts later in the day.

## Files

- starter environment: `environment.yml`
- verification scripts: `check_environment.py` and `check_environment.R`
- comparison projects: `../../demos/project-r-renv/` and `../../demos/project-python-uv/`

### Task

Inspect the starter files and create the environment they describe.

1. Read `environment.yml` once without editing.
2. Identify what `name`, `channels`, and `dependencies` mean.
3. Notice that this environment is meant to support Demo 2 and Activity 2 later in Day 3.
4. Create the environment with `conda env create -f environment.yml`.
5. Activate the environment.
6. Run `python check_environment.py` and `Rscript check_environment.R` to verify that the later Day 3 materials have the packages they need.
7. If time allows, compare `environment.yml` with `../../demos/project-r-renv/renv.lock`, `../../demos/project-python-uv/pyproject.toml`, and `../../demos/project-python-uv/.python-version`.

### What to Look For

- the environment name
- where conda should search for packages
- which Python and R packages will be installed
- which files describe an environment versus which folders get created locally

## Success Check

By the end, another learner should be able to answer these questions quickly:

- what does the `name` field do?
- what do the `channels` tell conda?
- what do the `dependencies` specify?
- how do you create and activate the environment?
- which later Day 3 materials does this environment support?
- what does `renv.lock` communicate?
- what do `pyproject.toml` and `.python-version` communicate?

## Discussion Prompt

- what did `environment.yml` make explicit?
- what did `renv.lock` communicate differently?
- what did `pyproject.toml` communicate differently?
- what part of environment setup still feels easiest to forget?
- what would still confuse a new lab member trying to recreate the setup?
