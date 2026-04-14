# Python `uv` Project

This folder shows one small way to package a Python script so another person can sync the project environment and run it.

## Runtime

- Python 3.13

## Files

- `summarize_model_counts.py`: analysis script
- `pyproject.toml`: project metadata and dependencies
- `.python-version`: intended Python runtime
- `.gitignore`: files and folders to keep out of version control

## Set Up

From this folder, run:

```bash
uv sync
```

This will create a local environment for the project.

## Run

```bash
uv run python summarize_model_counts.py
```

## Output

The script writes `results/model_counts.csv`.
