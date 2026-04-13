# Activity 1: Write an Executable Script

## Goal

Make a small analysis runnable by someone else without hidden setup steps.

## Scenario

Picture receiving a script from a collaborator who says, "It worked on my laptop yesterday." When you open the file, you notice hidden assumptions about file paths, packages, and what should run first.

Your task is to turn that personal script into something a teammate could run from a clean folder without needing the original author beside them.

This activity is inspired by `example_code/GSbyModel_012126 - Tessa.R`, which includes a working-directory change, machine-specific paths, and a script that runs itself at the bottom. The teaching starter is smaller, but your job is the same: remove guesswork.

This activity builds on Day 2. Reusable pieces are easier to turn into a repeatable workflow because the script can make inputs, outputs, and run order explicit.

## Files

- starter code: `starter.R` or `starter.py`
- example approach: `example.R` or `example.py`

### Task

Inspect the starter script and make the workflow steps explicit.

1. Read the script once without editing.
2. List the hidden assumptions about packages, paths, inputs, and outputs.
3. Rewrite the script so the analysis steps are easy to follow.
4. Make it clear what file gets written and where it goes.
5. Add one short note showing how a collaborator should run it.

### What to Look For

- hidden package requirements
- hard-coded output locations
- missing explanation of inputs and outputs
- no obvious run order or entry point
- anything that would make sense only if the original author were standing beside you

### What to Preserve

- the same yearly model counts
- the same filtered year range
- the same output table values
- one output file that records the result
