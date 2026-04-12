# Activity 2: Document and Rewrite a Code Chunk

## Goal

Make a short analysis script easier to understand without changing what it does.

## Scenario

Imagine a labmate sends you this script after a meeting and says, "This is the one I used to decide which samples to plot next." The script runs, but you are not sure what the objects mean, where the key decision happens, or whether the comments are helping.

Your job is not to redesign the analysis. Your job is to make the script readable enough that another person could open it tomorrow and understand the main story without asking the original author for a tour.

This starter is intentionally small, but it still includes the same kinds of readability problems that show up in real scripts: vague names, mixed responsibilities, noisy comments, and formatting that hides the flow.

This is the baseline skill for the rest of the workshop. If learners can explain what a script is doing today, they will be in a much better position to refactor, rerun, test, and share code on the next four days.

## Files

- starter code: `r/starter.R` or `python/starter.py`
- example approach: `r/example.R` or `python/example.py`

## Instructions

1. Read `r/starter.R` or `python/starter.py` once without editing.
2. Mark anything that slows down understanding.
3. Rewrite the script for readability.
4. Add a short script header describing the purpose of the file.
5. If you finish early, compare your version with the matching example file.

## What to Improve

Focus on readability, not new features.

- replace vague variables such as `d`, `k`, `x`, `y`, and `r` with descriptive names
- choose names that are easy to say, search for, and understand without extra comments
- make printed output easier to understand
- break up dense code so each section has a clearer purpose
- use blank lines and section order to help a reader follow the script from top to bottom
- add a short header comment that explains what the script produces
- remove or rewrite comments that only repeat what the code already says
- make it obvious where the priority score calculation happens and where the labels are assigned

## What to Preserve

- the same final priority scores
- the same priority labels
- the same average score

You may change formatting, naming, and structure, but not the underlying behavior.

## Suggested Pace

- `3 minutes`: read the script and annotate confusing parts
- `12 minutes`: rewrite names and structure
- `5 minutes`: add a script header and clean up output text
- `5 minutes`: compare with a partner or with the matching example file

## Success Check

By the end, another learner should be able to answer these questions quickly:

- what data is stored in each object?
- how is the priority score calculated?
- where are the labels such as `"plot"`, `"check"`, and `"ignore"` decided?
- what is printed at the end?
- can you scan the file from top to bottom and understand the main story without stopping at every line?

## Optional Extension

If your group finishes early, discuss:

- which changes were clearly better?
- which changes were mostly stylistic?
- what comment was worth adding, and what comment would have been unnecessary?
- what would need to change next if this script grew into a longer analysis file?
