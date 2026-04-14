# Environment Notes Demo

## Demo Goal

Guide learners through three small environment setups and show what each tool
records in files versus what each person creates locally on their own machine.

By the end of the demo, learners should be able to answer:

- what file records the environment requirements?
- what file records exact resolved versions?
- what folder or environment stays local to one machine?
- what command recreates the environment?

## Time Plan

- `0-2 min`: frame the problem
- `2-8 min`: create a simple `renv` environment
- `8-14 min`: create a simple `uv` environment
- `14-18 min`: create a simple conda environment
- `18-20 min`: compare the three approaches

## Files To Open During The Demo

- `environment-note-R.md`
- `environment-note-python.md`
- `project-r-renv/`
- `project-python-uv/`
- `../activities/activity-1/environment.yml`

Use these files during the walkthrough in this order:

1. `environment-note-R.md` with `project-r-renv/`
2. `environment-note-python.md` with `project-python-uv/`
3. `../activities/activity-1/environment.yml`

If you do not want to type every command live, use the commands below as
narration while opening these example materials from the repo.

## 1. Frame The Problem `0-2 min`

Use framing like this:

Someone can have the right script and still fail immediately because they do not
have the right runtime or packages. Reproducibility starts before the script
runs.

Today we will look at three ways of making setup more explicit:

- `renv` for an R project
- `uv` for a Python project
- `conda` from an `environment.yml` file

The question in all three cases is the same:

`What should I commit, and what should another person recreate locally?`

## 2. Create A Simple `renv` Environment `2-8 min`

### Open These Materials

- `environment-note-R.md`
- `project-r-renv/README.md`
- `project-r-renv/renv.lock`
- `project-r-renv/.gitignore`

### Commands To Show

```bash
mkdir demo-renv
cd demo-renv
Rscript -e "install.packages('renv', repos = 'https://cloud.r-project.org')"
Rscript -e "renv::init(bare = TRUE)"
Rscript -e "renv::install('dplyr')"
Rscript -e "renv::snapshot(prompt = FALSE)"
```

### What To Say

`renv` is centered on an R project directory. It gives this project its own
package library instead of relying on whatever happens to be installed
globally.

After showing the commands, open `environment-note-R.md` and
`project-r-renv/README.md` and use them to anchor the explanation. Then open
`project-r-renv/renv.lock` so learners can see the lock file you are talking
about, and briefly show `project-r-renv/.gitignore` to reinforce that the local
library should not be treated as the main shareable artifact.

### Files To Explain

- `renv.lock`
  This is the lock file.
  It records the exact package versions that were resolved for this project.
  This is the most important shareable environment file in a simple `renv`
  workflow.
- `renv/`
  This directory holds `renv` machinery for the project.
  In a real project, parts of this directory help activate the environment.
- `renv/library/`
  This is the project-specific package library created on one machine.
  It is local and should not be treated as the main shareable artifact.
- `.Rprofile`
  This helps the project activate `renv` automatically when someone opens the
  project.

In the repo example, the most visible shareable pieces are the script,
`renv.lock`, and the README that tells someone how to restore and run.

### Key Teaching Point

For this simple `renv` example, the lock file is doing most of the important
sharing work. Another person recreates the environment with:

```bash
Rscript -e "renv::restore(prompt = FALSE)"
```

## 3. Create A Simple `uv` Environment `8-14 min`

### Open These Materials

- `environment-note-python.md`
- `project-python-uv/README.md`
- `project-python-uv/pyproject.toml`
- `project-python-uv/.python-version`
- `project-python-uv/.gitignore`

### Commands To Show

```bash
mkdir demo-uv
cd demo-uv
uv init --bare
uv add pandas==2.3.2
uv sync
```

### What To Say

`uv` is also project-centered, but in Python it separates the requirements file
from the lock file more visibly than `renv` does.

After showing the commands, open `environment-note-python.md` and
`project-python-uv/README.md` to anchor the explanation. Then open
`project-python-uv/pyproject.toml` and `.python-version` so learners can see
where the intended runtime and direct dependencies live. Briefly show
`project-python-uv/.gitignore` to point out that `.venv/` is local.

### Files To Explain

- `pyproject.toml`
  This is the requirements or specification file for the project.
  It records the direct dependencies you want this project to have.
  It also records general project metadata.
- `uv.lock`
  This is the lock file.
  It records the exact resolved versions of the project dependencies.
- `.python-version`
  This communicates which Python runtime the project expects.
- `.venv/`
  This is the local environment created for one machine.
  It is useful locally but should not be the main thing you share.

### Key Teaching Point

In this workflow:

- `pyproject.toml` says what the project wants
- `uv.lock` says what exact versions were resolved
- `.venv/` is what each person recreates locally

Another person recreates the environment with:

```bash
uv sync
```

And runs the script with:

```bash
uv run python summarize_model_counts.py
```

If you want to connect back to the repo materials explicitly, say:

`The README tells me what to do, the pyproject tells me what the project wants, and the local environment is something I recreate rather than commit.`

## 4. Create A Simple Conda Environment `14-18 min`

### Open These Materials

- `../activities/activity-1/environment.yml`
- `../activities/activity-1/prompt.md`

### Commands To Show

```bash
mkdir demo-conda
cd demo-conda
```

Create `environment.yml`:

```yaml
name: demo-conda
channels:
  - conda-forge
dependencies:
  - python=3.13
  - pandas=2.3.2
```

Then run:

```bash
conda env create -f environment.yml
conda activate demo-conda
python -c "import pandas as pd; print(pd.__version__)"
```

You can compare this directly with `../activities/activity-1/environment.yml`.

Open that file while you explain the commands so learners can read the same
fields they will work with in Activity 1. If useful, also open
`../activities/activity-1/prompt.md` and point out that the activity is asking
them to interpret exactly these fields.

### Files To Explain

- `environment.yml`
  This is the shareable environment specification file.
  It records the environment name, the channels conda should search, and the
  dependencies to install.
- `name`
  This becomes the environment name users activate later.
- `channels`
  These tell conda where to search for packages.
- `dependencies`
  These list the runtime and packages the environment should contain.

### Key Teaching Point

For this simple conda example, `environment.yml` is the main shareable file.
The created environment itself lives outside the project directory and is local
to each machine.

Unlike the `uv` and `renv` examples above, this small demo does not add a
separate lock file. That is useful to mention explicitly so learners see that
different tools expose different file patterns.

## 5. Compare The Three Approaches `18-20 min`

Use a wrap-up like this:

| Tool | Main requirements file | Lock file | Local recreated environment |
| --- | --- | --- | --- |
| `renv` | project setup plus package install history | `renv.lock` | project library under `renv/` |
| `uv` | `pyproject.toml` | `uv.lock` | `.venv/` |
| `conda` | `environment.yml` | not shown in this simple demo | named conda environment |

Then close with:

- all three tools reduce setup guesswork
- the shareable files are usually small
- the installed environment itself is usually local
- reproducibility improves when someone can see both the setup files and the
  command to recreate the environment

At this point, learners should be able to point to the actual materials you
opened and answer:

- where do I look for the requirements?
- where do I look for exact resolved versions, if there is a lock file?
- what do I recreate locally instead of committing?

## Suggested Closing Question

Ask:

`If you had to rerun this project six months from now on another machine, which file would you look for first?`
