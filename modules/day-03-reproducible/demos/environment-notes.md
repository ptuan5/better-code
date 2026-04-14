# Environment Notes Demo

## Demo Goal

Show how to turn a runnable script into a small project folder that another person can actually set up and run.

This demo assumes you have already introduced the basic idea of virtual environments and are now moving into concrete examples.

## Files

- `environment-note-R.md`
- `environment-note-python.md`
- `project-r-renv/`
- `project-python-uv/`
- `../activities/activity-1/environment.yml`

## Scenario

Use this framing:

Before we even talk about script entry points, a collaborator may still get blocked by setup. They might have the wrong runtime, missing packages, or no idea which environment command to run first.

This demo compares three ways of making setup more explicit:

- an R project with `renv`
- a Python project with `uv`
- a conda environment created from `environment.yml`

## Minimal Example

Open the matching language note file and project folder, then compare them with `activities/activity-1/environment.yml`. Ask whether the files answer the biggest rerun questions quickly.

## What This Note Makes Explicit

- which environment tool is being used
- which language or runtime is required
- which direct packages belong in the environment
- which file records those requirements
- what command creates or restores the environment
- what command activates it, if needed
- what command runs the script afterward
- which files belong in version control and which are local only

## Demo Moves

1. Start from a script that has no environment instructions.
2. Ask what a new collaborator would need before any script command will actually work.
3. Open `project-r-renv/` and identify what `renv.lock` records.
4. Open `project-python-uv/` and identify what `pyproject.toml` and `.python-version` record.
5. Open `activities/activity-1/environment.yml` and show how `conda env create -f environment.yml` fits the same problem from a different angle.
6. Point out which files should be committed and which environment folders are machine-local.

## Suggested Talking Points

- Reproducibility documentation does not need to be long to be useful.
- An isolated environment reduces conflicts between projects.
- A runtime version matters just as much as a package name.
- In Python, `uv` centers the project around `pyproject.toml` and a managed local environment.
- In R, `renv.lock` plus `renv::restore()` gives a project-specific package library.
- In conda, `environment.yml` describes the environment directly and can be used to create it from scratch.
- Good environment notes remove guesswork before anyone starts debugging.
