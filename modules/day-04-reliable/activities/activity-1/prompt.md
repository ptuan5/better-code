# Activity 1: What Is Wrong With This Code?

## Goal

Practice inspecting code for bugs, edge cases, and hidden assumptions before trusting the output.

## Scenario

Imagine a collaborator sends you a helper function and says, "I think this overlap calculation is right now." The examples at the bottom look plausible, but you are not fully convinced because edge cases are exactly where this kind of code tends to fail.

Your job is to review the function like a careful scientific collaborator, not like someone trying to be impressed that it runs at all.

This activity is inspired by `example_code/iou_calculation.py`. The teaching starter is smaller than the IoU code, but it keeps the same core lesson: a function can look reasonable and still be wrong at the boundaries.

This activity builds on Day 3. A script that runs consistently is helpful, but reliability asks a harder question: does it produce the right result under normal and edge cases?

## Files

- starter code: `starter.R` or `starter.py`
- example approach: `example.R` or `example.py`

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
