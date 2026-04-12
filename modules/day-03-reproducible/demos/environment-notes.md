# Environment Notes Demo

## Demo Goal

Show the minimum documentation another person needs to rerun a small script from a clean folder.

## Scenario

Use this framing:

You are about to go on vacation, and a labmate may need to rerun your script while you are away. The code might be fine, but without one short note they still may not know which package is required, what command to use, or what output should appear.

The demo shows how little documentation can still be genuinely useful when it answers the right questions.

## Minimal Example

```md
# Model Count Summary

## Requirements
- R with `dplyr`

## Run
Run `Rscript starter.R` from this folder.

## Output
The script writes `results/model_counts.csv`.
```

## What This Note Makes Explicit

- which language or runtime is required
- which package is required
- what command to run
- what file should appear afterward

## Demo Moves

1. Start from a script that has no environment note.
2. Ask what a new collaborator would need to know first.
3. Write the shortest note that closes the biggest gaps.
4. Keep the note concrete and action-oriented.

## Suggested Talking Points

- Reproducibility documentation does not need to be long to be useful.
- Package names, run commands, and output locations are often enough for a small demo.
- Good environment notes remove guesswork before anyone starts debugging.
