# Activity 1: Write an Executable Script

## Goal

Make a small analysis runnable by someone else without hidden setup steps.

## Files

- starter code: `r/starter.R` or `python/starter.py`
- example approach: `r/example.R` or `python/example.py`

### Task

Inspect the starter script and make the workflow steps explicit.

1. Read the script once without editing.
2. List the hidden assumptions about packages, paths, inputs, and outputs.
3. Rewrite the script so the analysis steps are easy to follow.
4. Make it clear what file gets written and where it goes.

### What to Look For

- hidden package requirements
- hard-coded output locations
- missing explanation of inputs and outputs
- no obvious run order or entry point

### What to Preserve

- the same mean difference calculation
- the same output table values
- one output file that records the result
