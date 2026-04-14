# Python Project with `uv`

## Demo Goal

Show how a small Python project records package requirements with `pyproject.toml` and gives a collaborator a `uv` workflow instead of assuming packages are already installed.

## Project Folder

- `project-python-uv/README.md`
- `project-python-uv/pyproject.toml`
- `project-python-uv/.python-version`
- `project-python-uv/summarize_model_counts.py`

## What to Notice

- the analysis script lives beside the project metadata
- `pyproject.toml` records the Python dependency for the project
- `.python-version` makes the intended runtime easy to spot
- the README gives the sync and run commands
- the `.venv/` folder is local to each machine and should not be committed

## Setup Flow

From `demos/project-python-uv/`, a collaborator should be able to:

```bash
uv sync
uv run python summarize_model_counts.py
```

## Suggested Talking Points

- `uv` reads the project metadata and manages a local environment for the project.
- `pyproject.toml` is the shareable file; `.venv/` is the local environment that each person creates.
- `.python-version` helps communicate which interpreter the project expects.
- Compared with conda, `uv` is more tightly centered on the project folder.
- The project folder should answer both "how do I install?" and "what do I run?"
