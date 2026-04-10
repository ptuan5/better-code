# Day 1: Readable

Theme: Write code you will understand six months later.

## Learning Goals

By the end of this module, participants should be able to:

1. Recognize common readability problems in scientific code.
2. Organize files so data, scripts, and outputs are easier to navigate.
3. Improve naming, comments, and structure without changing behavior.
4. Explain why readability matters for collaboration and maintenance.

## Materials

- `demos/folder-structure.md`
- `activities/activity-1/prompt.md`
- `activities/activity-2/prompt.md`
- `activities/activity-2/r/starter.R` or `activities/activity-2/python/starter.py`
- `activities/activity-2/r/example.R` or `activities/activity-2/python/example.py`

This day uses teaching-sized materials inspired by `example_code/lincRNA_2.R`, especially its long setup, crowded imports, hard-coded paths, and mixed analysis and plotting flow.

## Course Connection

This is the foundation day for the whole workshop. If learners cannot quickly understand what a script or project is doing, it is much harder to make that work reusable, reproducible, reliable, or shareable later in the week.

## Agenda

### 1. Course Introduction & Structure

Time: 20 minutes

- introduce the workshop goals
- review the daily structure and reference materials

### 2. Why & What

Time: 10 minutes

- discuss why readable code matters
- define what readability includes: clear project structure, clear names, useful sectioning, and comments that explain intent

### 3. Demo: Folder Structure

Time: 10 minutes

- Show one messy transcriptomics-style project tree from `demos/folder-structure.md`.
- Point out the kinds of clutter that appear in `example_code/lincRNA_2.R`: raw inputs, transformed objects, plotting code, and notes all mixed together.
- Compare two valid organization strategies: `data/`, `scripts/`, `results/`, and `docs/`; or a workflow layout such as `01-load/`, `02-normalize/`, `03-pca/`, and `04-figures/`.
- Highlight what both versions make obvious to a newcomer in under a minute.

### 4. Activity 1: Organize a Repo

Time: 20 minutes

1. Open `activities/activity-1/prompt.md`.
2. Group the messy transcriptomics files into clearer folders and rename the most confusing files.
3. Decide what should stay active, what should move to `archive/`, and what needs a short README note.
4. Be ready to explain one tradeoff you made.

### 5. Discussion

Time: 15 minutes

- what structure choices felt clearly better versus mostly stylistic?
- what should always be obvious from the top level of a project?
- when is it worth creating more folders, and when does that add clutter?
- what parts of a biology project are most often hard to locate later: data, metadata, scripts, or outputs?

## Break

Time: 15 minutes

### 6. Demo: Readable Code

Time: 15 minutes

- Open `activities/activity-2/r/starter.R` or `activities/activity-2/python/starter.py`.
- Explain that the starter is smaller than `example_code/lincRNA_2.R`, but it preserves the same teaching problems: unclear object names, mixed responsibilities, and little guidance for a reader.
- Mark vague names, repeated logic, long blocks, and unhelpful output labels.
- Model a cleanup sequence: rename first, separate responsibilities second, then add a short script header.

### 7. Activity 2: Document and Rewrite a Code Chunk

Time: 25 minutes

1. Open `activities/activity-2/prompt.md`.
2. Work from `activities/activity-2/r/starter.R` or `activities/activity-2/python/starter.py`.
3. Rewrite for clarity without changing behavior.
4. Add a short docstring or script header explaining the purpose of the file and the main output.
5. Compare your version with `activities/activity-2/r/example.R` or `activities/activity-2/python/example.py` if time allows.

### 8. Discussion

Time: 15 minutes

- which readability change gave the biggest payoff?
- where did people make different but still reasonable choices?
- what comments or docstrings were useful, and what would have been noise?
- what would still feel hard to scan if this script grew from 30 lines to 300?

### 9. Wrap-Up

Time: 5 minutes

- collect one readability habit each person wants to keep using
- connect today's work to tomorrow's focus on reusable functions

## Notes

This is a good day to normalize that "better" code is not the same thing as "perfect" code. Encourage participants to make incremental changes and explain why each change improves understanding. Keep tying the lesson back to the larger, messier reality of `example_code/lincRNA_2.R`.
