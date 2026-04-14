# Day 3: Reproducible

Theme: Someone else, or future you, can rerun everything.

## Learning Goals

By the end of this module, participants should be able to:

1. Explain why workflows fail across machines and over time.
2. Compare a few common ways projects record their environments.
3. Create a conda environment from an `environment.yml` file and explain what its main fields mean.
4. Turn ad hoc scripts into more deliberate, repeatable workflows with a clear entry point.

## Materials

- `demos/virtual-environments.md`
- `demos/environment-notes.md`
- `demos/environment-note-R.md` or `demos/environment-note-python.md`
- `demos/project-r-renv/`
- `demos/project-python-uv/`
- `activities/activity-1/prompt.md`
- `activities/activity-1/environment.yml`
- `activities/activity-1/check_environment.py`
- `demos/script-entrypoint.md`
- `demos/script-entrypoint.R` or `demos/script-entrypoint.py`
- `activities/activity-2/prompt.md`
- `activities/activity-2/starter.R` or `activities/activity-2/starter.py`
- `activities/activity-2/example.R` or `activities/activity-2/example.py`

This day focuses on common reproducibility problems such as `setwd()`, user-specific paths, missing packages, and automatic execution at the bottom of a script.

## Agenda

### 1. Why Reproducible & What It Entails

Time: 15 minutes

- discuss why code breaks across machines and over time
- surface examples of missing packages, hidden paths, and undocumented steps
- connect these risks to the kind of script that only works on one person's machine without cleanup

### 2. Virtual Environments

Time: 10 minutes

- introduce the idea that reproducibility starts before the script runs
- define an environment as the runtime plus the packages it depends on
- use `demos/virtual-environments.md` to compare project-local and shared environment tools at a high level
- preview the three concrete examples learners will see next: `renv`, `uv`, and `conda`

### 3. Demo: Project Environments with `renv`, `uv`, and `conda`

Time: 20 minutes

- explain why a script can still fail even if the code itself looks clean
- open `demos/project-r-renv/` and `demos/project-python-uv/`
- use `demos/environment-notes.md` plus the matching language note to compare how `renv` and `uv` record project setup
- open `activities/activity-1/environment.yml` and show the equivalent conda setup command
- clarify what each tool stores in files versus what gets created locally on each machine

### 4. Activity 1: Create a Conda Environment

Time: 15 minutes

1. Open `activities/activity-1/prompt.md`.
2. Inspect `activities/activity-1/environment.yml`.
3. Create the environment with `conda`.
4. Activate the environment and run the verification script.
5. If time allows, compare the conda file with the `renv` and `uv` project files from the demo.

### 5. Discussion

Time: 15 minutes

- what information did `environment.yml` make explicit?
- what did `renv.lock` communicate that the conda file did not?
- what did `pyproject.toml` communicate that looked different from both?
- what still depends on the machine, even when the environment files are present?

## Break

Time: 15 minutes

### 6. Demo: Turn Interactive Functions Into Scripts

Time: 15 minutes

- show the difference between ad hoc execution and a clear entry point
- open `demos/script-entrypoint.R` or `demos/script-entrypoint.py`
- use `demos/script-entrypoint.md` to model the shift from hidden setup to a clear runnable script
- highlight hidden assumptions such as `setwd()`, automatic execution, and unexplained outputs
- connect those assumptions to the smaller starter learners will edit

### 7. Activity 2: Write an Executable Script

Time: 25 minutes

1. Open `activities/activity-2/prompt.md`.
2. Work from `activities/activity-2/starter.R` or `activities/activity-2/starter.py`.
3. List assumptions about paths, inputs, outputs, and execution order.
4. Rewrite the file so inputs, outputs, and run steps are explicit.
5. Add brief instructions for how to run it.
6. Compare your version with `activities/activity-2/example.R` or `activities/activity-2/example.py` if time allows.

### 8. Discussion

Time: 15 minutes

- what would another researcher still need in order to rerun the work?
- what belongs in the script versus in documentation?
- what information is easy to remember today but easy to forget next month?
- what did the script entry point solve that the environment files did not?

### 9. Day Wrap Up / Buffer Time

Time: 5 minutes

- summarize the minimum information needed for reproducibility
- preview tomorrow's focus on reliability and tests

## Notes

Participants often think reproducibility only means package management. Use this module to broaden that definition to include paths, inputs, outputs, execution order, and documentation.

At the same time, do not treat package management as the whole story. A reproducible workflow needs both environment setup and a script that makes execution obvious.
