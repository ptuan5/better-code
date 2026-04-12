# Day 1: Readable

Theme: Write code you will understand six months later.

## Learning Goals

By the end of this module, participants should be able to:

1. Recognize common readability problems in scientific code.
2. Organize files so data, scripts, and outputs are easier to navigate.
3. Improve names, comments, and formatting without changing behavior.
4. Explain why readable code matters for collaboration, maintenance, and speed.

## Materials

- `demos/folder-structure.md`
- `demos/readable-code.md`
- `activities/activity-1/prompt.md`
- `activities/activity-2/prompt.md`
- `activities/activity-2/r/starter.R` or `activities/activity-2/python/starter.py`
- `activities/activity-2/r/example.R` or `activities/activity-2/python/example.py`

This day uses teaching-sized materials that highlight long setup blocks, crowded imports, hard-coded paths, and mixed analysis and plotting flow.

## Agenda

### 1. Course Introduction & Structure

Time: 20 minutes

- introduce the workshop goals
- review the daily structure and reference materials

### 2. Why & What

Time: 10 minutes

- discuss why readable code matters
- explain that readable code is a communication tool, not just a style preference
- define what readability includes: clear project structure, intention-revealing names, useful sectioning, and comments that explain intent rather than restating syntax

### 3. Demo: Folder Structure

Time: 10 minutes

- Show one messy transcriptomics-style project tree from `demos/folder-structure.md`.
- Point out the kinds of clutter that make a project hard to scan: raw inputs, transformed objects, plotting code, notes, and vague file names all mixed together.
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
- Use `demos/readable-code.md` to model one small cleanup from vague script to readable script.
- Explain that the starter is intentionally small, but it still preserves the same teaching problems: unclear names, noisy comments, mixed responsibilities, and hard-to-scan formatting.
- Mark vague names, repeated logic, long blocks, weak output labels, and comments that could be replaced by clearer code.
- Model a cleanup sequence: rename first, separate responsibilities second, improve spacing and grouping, then add a short script header or one useful intent comment.

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
- what formatting or spacing change made the script easier to scan top to bottom?
- what would still feel hard to scan if this script grew from 30 lines to 300?

### 9. Wrap-Up

Time: 5 minutes

- collect one readability habit each person wants to keep using
- connect today's work to tomorrow's focus on reusable functions

## Notes

This is a good day to normalize that "better" code is not the same thing as "perfect" code. Encourage participants to make incremental changes and explain why each change improves understanding. Keep tying readability back to communication: names should reveal intent, comments should earn their place, and formatting should help a reader follow the story of the code.
