# Environment Notes Demo

## Demo Goal

Start with two tiny project folders that each contain only one simple script.
Then show how `renv`, `uv`, and conda make the environment explicit.

By the end of the demo, learners should be able to answer:

- what file should I share with someone else?
- what file records exact resolved versions?
- what folder or environment gets recreated locally?
- what command rebuilds the setup?

## Presenter Setup

Use these files during the demo:

- `project-r-renv/mock_scripts.R`
- `project-python-uv/mock_scripts.py`
- `project-r-renv/renv.lock`
- `project-python-uv/pyproject.toml`
- `project-python-uv/.python-version`
- `project-python-uv/uv.lock`
- `../activities/activity-1/environment.yml`

Teaching note:

- Start by pretending each project folder only contains the simple script.
- If you want to type commands live, do that in a temporary scratch folder that
  contains only the script.
- The shareable environment files are already in the repo as a reference
  version, so open them after showing the commands instead of generating them
  in place here.
- The scripts are intentionally boring so the attention stays on setup, not
  logic.

## Scenario

You have a folder with one script that uses a package:

- the R script loads `dplyr` and prints its version
- the Python script imports `pandas` and prints its version

The code is not the problem. The problem is this:

`How does the next person know what to install and how to recreate it?`

## 1. Start With A Bare Folder

Frame the starting point like this:

- there is a script
- there is no clear environment file yet
- another person might not know which runtime or package versions to use

That is the gap we are fixing with `renv`, `uv`, and conda.

## 2. Add `renv` From Scratch

Start from `project-r-renv/mock_scripts.R`.
If you are typing live, copy that script into a temporary scratch folder first.

Suggested live flow:

```bash
Rscript -e "install.packages('renv', repos = 'https://cloud.r-project.org')"
Rscript -e "renv::init(bare = TRUE)"
Rscript -e "renv::install('dplyr')"
Rscript -e "renv::snapshot(prompt = FALSE)"
Rscript -e "renv::run('mock_scripts.R')"
```

Then open the reference files in `project-r-renv/`:

- `mock_scripts.R`
- `renv.lock`
- `.gitignore`

Key points to explain:

- `renv::init()` turns the folder into a project managed by `renv`.
- `renv::install()` adds the package to the project library.
- `renv::snapshot()` writes `renv.lock`.
- `renv.lock` is the main shareable environment file for this example.
- `renv.lock` also records exact package versions.
- the local project library under `renv/library/` is recreated on each machine
  and should not be committed
- in a fuller `renv` project you will also see files such as `renv/activate.R`
  that help bootstrap the project library

What to commit:

- `mock_scripts.R`
- `renv.lock`
- `.gitignore`

What another person recreates locally:

- the project library under `renv/`

What they run on their own machine:

```bash
Rscript -e "install.packages('renv', repos = 'https://cloud.r-project.org')"
Rscript -e "renv::restore(prompt = FALSE)"
Rscript -e "renv::run('mock_scripts.R')"
```

## 3. Add `uv` From Scratch

Start from `project-python-uv/mock_scripts.py`.
If you are typing live, copy that script into a temporary scratch folder first.

Suggested live flow:

```bash
uv init --bare
uv python pin 3.13
uv add pandas==2.3.2
uv sync
uv run mock_scripts.py
```

Then open the reference files in `project-python-uv/`:

- `mock_scripts.py`
- `pyproject.toml`
- `.python-version`
- `uv.lock`
- `.gitignore`

Key points to explain:

- `uv init --bare` creates the project metadata file
- `uv python pin 3.13` records the intended interpreter in `.python-version`
- `uv add` records the direct dependency in `pyproject.toml` and updates
  `uv.lock`
- `uv.lock` records the exact resolved versions
- `uv sync` creates the local `.venv/`
- `.venv/` is recreated on each machine and should not be committed

What to commit:

- `mock_scripts.py`
- `pyproject.toml`
- `.python-version`
- `uv.lock`
- `.gitignore`

What another person recreates locally:

- `.venv/`

What they run on their own machine:

```bash
uv sync
uv run python mock_scripts.py
```

## 4. Add Conda From Scratch

Start from a temporary scratch folder with no `environment.yml` yet.

Suggested live flow:

```bash
conda create -n betterCode -c conda-forge \
  python=3.13 pandas=2.3.2 \
  r-base=4.5 r-dplyr 
conda activate betterCode
conda env export > environment.yml
```

Then inspect the generated `environment.yml`, identify where my enviroment lies (`conda info --envs`). Delete environment with `conda env remove - n betterCode`

Caveats: Confirm no leakage (`which python` and `which R`). Alternative path to install `conda config --add envs_dirs [conda_envs_dir_path]`.


Key points to explain:

- `conda create` builds the local named environment from an explicit package
  list
- `-c conda-forge` makes the package source explicit
- `conda env export --from-history` writes the shareable `environment.yml`
- `environment.yml` records the packages you intentionally asked for, not a
  full lock file
- the created conda environment is local to each machine
- in this example, conda can hold both Python and R packages in one
  environment

What to commit:

- `environment.yml`

What another person recreates locally:

- the named conda environment

What they run on their own machine:

```bash
conda env create -f environment.yml
conda activate betterCode
```

## 5. Quick Comparison

| Tool | Start with | Shareable requirement file(s) | Exact resolved versions | Local recreated setup | Recreate command |
| --- | --- | --- | --- | --- | --- |
| `renv` | `mock_scripts.R` | `renv.lock` | `renv.lock` | `renv/library/` | `renv::restore()` |
| `uv` | `mock_scripts.py` | `pyproject.toml`, `.python-version`, `uv.lock` | `uv.lock` | `.venv/` | `uv sync` |
| `conda` | explicit package list | `environment.yml` | not locked in this demo | named conda environment | `conda env create -f environment.yml` |

Main contrast:

- `renv.lock` is both the shareable file and the exact version record
- `uv` splits direct requirements from exact resolved versions
- conda can produce one shareable file from the packages you asked for, but it
  is not a full lock file in this lesson

## 6. Wrap-Up Question

End by asking learners:

- what would you commit?
- what would another person recreate locally?
- where would you look for exact versions?
- which tool keeps the environment information closest to the project folder?
