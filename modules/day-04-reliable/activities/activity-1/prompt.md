# Activity 1: What Is Wrong With This Code?

## Goal

Practice inspecting code for bugs, edge cases, and hidden assumptions before trusting the output.

This activity is inspired by `example_code/iou_calculation.py`. The teaching starter is smaller than the IoU code, but it keeps the same core lesson: a function can look reasonable and still be wrong at the boundaries.

This activity builds on Day 3. A script that runs consistently is helpful, but reliability asks a harder question: does it produce the right result under normal and edge cases?

## Files

- starter code: `r/starter.R` or `python/starter.py`
- example approach: `r/example.R` or `python/example.py`

### Task

Review the starter script like a skeptical collaborator.

1. Read the script without editing.
2. List behaviors that seem suspicious or fragile.
3. Fix the most important logic problems.
4. Run a few manual checks before comparing with the example approach.

### Places to Inspect

- whether exact boundary overlap is counted correctly
- what happens when intervals do not overlap at all
- what happens when an interval is invalid
- whether labels match the numeric result
- whether the function behavior is obvious from the name
- whether the examples at the bottom are enough to make you trust the function
