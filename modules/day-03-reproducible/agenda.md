# Day 3: Reproducible

Theme: Someone else, or future you, can rerun everything.

## Learning Goals

By the end of this module, participants should be able to:

1. Explain why workflows fail across machines and over time.
2. Record dependencies and execution steps clearly.
3. Turn ad hoc scripts into more deliberate, repeatable workflows.
4. Describe inputs, outputs, and run order for a small analysis task.

## Materials

- `demos/script-entrypoint.md`
- `demos/environment-notes.md`
- `activities/activity-1/prompt.md`
- `activities/activity-1/r/starter.R` or `activities/activity-1/python/starter.py`
- `activities/activity-1/r/example.R` or `activities/activity-1/python/example.py`
- `activities/activity-2/prompt.md`

This day focuses on common reproducibility problems such as `setwd()`, user-specific paths, and automatic execution at the bottom of a script.

## Agenda

### 1. Why Reproducible & What It Entails

Time: 15 minutes

- discuss why code breaks across machines and over time
- surface examples of missing packages, hidden paths, and undocumented steps
- connect these risks to the kind of script that only works on one person's machine without cleanup

### 2. Demo: Turn Interactive Functions Into Scripts

Time: 15 minutes

- show the difference between ad hoc execution and a clear entry point
- use `demos/script-entrypoint.md` to model the shift from hidden setup to a clear runnable script
- highlight hidden assumptions such as `setwd()`, automatic execution, and unexplained outputs
- connect those assumptions to the smaller starter learners will edit

### 3. Activity 1: Write an Executable Script

Time: 30 minutes

1. Open `activities/activity-1/prompt.md`.
2. Work from `activities/activity-1/r/starter.R` or `activities/activity-1/python/starter.py`.
3. List assumptions about packages, paths, and execution order.
4. Rewrite the file so inputs, outputs, and run steps are explicit.
5. Add brief instructions for how to run it.

### 4. Discussion

Time: 15 minutes

- what assumptions were hardest to notice at first?
- what change made the script easiest to rerun?
- what would still block someone trying to run this from a clean folder?

## Break

Time: 15 minutes

### 5. Demo: Virtual Environments

Time: 15 minutes

- explain why dependency tracking matters
- use `demos/environment-notes.md` to model the smallest useful rerun note for a collaborator
- show what a dependency note should communicate even in a small one-file script
- clarify the difference between packages, input files, working directory, and output location

### 6. Activity 2: Reconstruct the Environment

Time: 25 minutes

1. Open `activities/activity-2/prompt.md`.
2. Identify the packages your script depends on.
3. Write a minimal environment note or dependency list.
4. Add the shortest run instruction that would let a new collaborator reproduce the output.
5. Compare your version with `activities/activity-1/r/example.R` or `activities/activity-1/python/example.py` if time allows.

### 7. Discussion

Time: 15 minutes

- what would another researcher still need in order to rerun the work?
- what belongs in the script versus in documentation?
- what information is easy to remember today but easy to forget next month?

### 8. Day Wrap Up / Buffer Time

Time: 5 minutes

- summarize the minimum information needed for reproducibility
- preview tomorrow's focus on reliability and tests

## Notes

Participants often think reproducibility only means package management. Use this module to broaden that definition to include paths, inputs, outputs, execution order, and documentation.
