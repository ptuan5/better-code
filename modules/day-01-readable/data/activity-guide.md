# Activity Guide

Theme: Write code you will understand six months later.

### 1. Course Introduction & Structure

Time: 20 minutes

- introduce the workshop goals
- review the daily structure and reference materials

### 2. Why & What

Time: 10 minutes

- discuss why readable code matters
- define what readability includes:
  - organized projects and files
  - clear names and documentation

### 3. Demo: Folder Structure

Time: 10 minutes

- Show one messy project tree from `data/folder-structure-demo.md`
- Compare two valid ways to organize it:
  - by artifact type such as `data/`, `scripts/`, `results/`, and `docs/`
  - by workflow stage such as `01-collect/`, `02-clean/`, and `03-figures/`
- Highlight what both versions make obvious to a newcomer

### 4. Activity 1: Organize a Repo

Time: 20 minutes

1. Open `activity-1-messy-directory.md`.
2. Group files into clearer folders and rename the most confusing files.
3. Decide what should stay active, what should move to `archive/`, and what needs a short README note.
4. Be ready to explain one tradeoff you made.

### 5. Discussion

Time: 15 minutes

- what structure choices felt clearly better versus mostly stylistic?
- what should always be obvious from the top level of a project?
- when is it worth creating more folders, and when does that add clutter?

## Break

Time: 15 minutes

### 6. Demo: Readable Code

Time: 15 minutes

- Open `r/starter.R` or `python/starter.py`.
- Mark vague names, repeated logic, long blocks, and unhelpful output labels.
- Model a cleanup sequence: rename first, separate responsibilities second, then add a short script header.

### 7. Activity 2: Document and Rewrite a Code Chunk

Time: 25 minutes

1. Open `data/activity-2-rewrite-code.md`.
2. Work from `r/starter.R` or `python/starter.py`.
3. Rewrite for clarity without changing behavior.
4. Add a short docstring or script header explaining the purpose of the file.
5. Compare your version with the matching solution file if time allows.

### 8. Discussion

Time: 15 minutes

- which readability change gave the biggest payoff?
- where did people make different but still reasonable choices?
- what comments or docstrings were useful, and what would have been noise?

### 9. Wrap-Up

Time: 5 minutes

- collect one readability habit each person wants to keep using
- connect today's work to tomorrow's focus on reusable functions
