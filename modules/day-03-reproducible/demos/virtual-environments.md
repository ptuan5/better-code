# Virtual Environments

## Demo Goal

Give learners a short conceptual map of what an environment is before showing specific tools.

## Core Idea

A script can still fail even if the code looks fine. Reproducibility starts with the environment:

- which language runtime is being used
- which packages are installed
- where those packages live
- how another person recreates that setup

## Three Examples For Today

- `renv`: an R project records package state with `renv.lock` and restores a project-specific library
- `uv`: a Python project records metadata in `pyproject.toml` and manages a local environment for the project
- `conda`: an `environment.yml` file describes an environment directly and can be used to create it from scratch

## Suggested Talking Points

- Different tools solve the same basic problem in different ways.
- Some tools are tightly centered on one project folder.
- Some tools create environments from a standalone specification file.
- In all cases, the goal is to reduce hidden setup assumptions.
