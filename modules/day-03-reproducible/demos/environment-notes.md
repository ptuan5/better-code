# Environment Notes Demo

## Demo Goal

Guide learners through three small environment setups and show what each tool
records in files versus what each person creates locally on their own machine.

By the end of the demo, learners should be able to answer:

- what file records the environment requirements?
- what file records exact resolved versions?
- what folder or environment stays local to one machine?
- what command recreates the environment?

## Scenario

You have a working project directory with several scripts.
You want to keep track of the package versions that you use.

Today we will look at three ways of making setup more explicit:

- For an R project (`project-r-renv`), we will use `renv` to manage its
  packages.
- For a Python project (`project-python-uv`), we will use `uv` to manage its
  packages.
- We will use conda to manage an environment that can hold both.

The question in all three cases is the same:

`What should I commit, and what should another person recreate locally?`

## 1. Create A Simple `renv` Environment

Open `project-r-renv/` and point out:

- `summarize_model_counts.R`
- `renv.lock`
- `.gitignore`

Suggested flow to talk through:

```r
renv::init()
renv::install("dplyr")
renv::snapshot()
renv::restore()
```

Key points to explain:

- `renv::init()` sets up project-level package management for this R project.
- `renv::install()` adds packages to the project library instead of relying on
  whatever happens to be installed globally.
- `renv::snapshot()` updates `renv.lock`; this is not automatic.
- `renv::restore()` recreates the project library on another machine from the
  lock file.
- `renv.lock` records the R version, repository, and exact package versions to
  restore.
- The local package library in `renv/library/` stays machine-local and should
  not be committed.
- In a fully initialized `renv` project, you will usually also see
  `renv/activate.R`, which helps bootstrap the project library when the project
  opens.
- `renv` works at the project level, so scripts can still live in nested
  folders and use the same environment.

Concrete restore command for this demo:

```bash
Rscript -e "install.packages('renv', repos = 'https://cloud.r-project.org')"
Rscript -e "renv::restore(prompt = FALSE)"
Rscript summarize_model_counts.R
```

## 2. Create A Simple `uv` Environment

Open `project-python-uv/` and point out:

- `summarize_model_counts.py`
- `pyproject.toml`
- `uv.lock`
- `.python-version`
- `.gitignore`

Suggested flow to talk through:

```bash
uv add pandas==2.3.2
uv lock
uv sync
uv run python summarize_model_counts.py
```

Key points to explain:

- `pyproject.toml` records the project's direct dependencies and Python
  requirement.
- `uv.lock` records the exact resolved versions, including transitive
  dependencies.
- `uv sync` uses those files to create a local `.venv/` for this project.
- `.venv/` is recreated on each machine and should not be committed.
- `.python-version` makes the intended interpreter easy to spot.
- Compared with `renv`, `uv` splits "what the project asks for" from "what got
  resolved exactly."

Concrete setup command for this demo:

```bash
uv sync
uv run python summarize_model_counts.py
```

## 3. Create A Simple Conda Environment

Open `../activities/activity-1/environment.yml` and point out:

- `name`: the environment name learners will activate
- `channels`: where conda should search for packages
- `dependencies`: the requested packages and versions

Concrete setup flow:

```bash
conda env create -f environment.yml
conda activate day03-conda-demo
```

Key points to explain:

- `environment.yml` is the shareable file to commit.
- The conda environment itself is local to each machine and is recreated from
  the file.
- In this example, one conda environment can include both Python and R
  packages.
- Unlike `uv.lock` or `renv.lock`, this file does not fully lock every
  resolved build in the demo.
- In VS Code, learners should select the interpreter from the created conda
  environment.
- In RStudio, learners need to start or configure the session to use the R
  executable from that same conda environment if they want the conda-managed R
  packages.

## 4. Quick Comparison

Use this table to keep the three examples aligned:

| Tool | Shareable requirement file | Exact resolved versions | Local folder or environment | Recreate command |
| --- | --- | --- | --- | --- |
| `renv` | `project-r-renv/renv.lock` | `project-r-renv/renv.lock` | `renv/library/` | `renv::restore()` |
| `uv` | `project-python-uv/pyproject.toml` | `project-python-uv/uv.lock` | `.venv/` | `uv sync` |
| `conda` | `../activities/activity-1/environment.yml` | not locked in this demo | named conda environment on each machine | `conda env create -f environment.yml` |

Important comparison:

- `renv.lock` is both the shareable environment record and the lock file.
- `pyproject.toml` declares direct dependencies, while `uv.lock` records the
  fully resolved environment.
- `environment.yml` is a shareable specification, but it is not a full lock
  file in this demo.

## 5. Wrap-Up Question

End by asking learners to answer these four questions for each tool:

- what file should you commit?
- what file, if any, records exact resolved versions?
- what folder or environment stays local?
- what command recreates the setup on another machine?
