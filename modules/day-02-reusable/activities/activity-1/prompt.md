# Activity 1: Break This Code Into Smaller Functions

## Goal

Reduce repetition by turning repeated analysis steps into small, reusable functions.

## Scenario

Imagine you inherit a short analysis script that summarizes results for three tissues: liver, heart, and brain. The script gives the right answers, but the same filtering, counting, and printing pattern appears over and over with only small changes.

Your collaborator now wants to add more tissues next week. Before that happens, you want to pull the repeated work into one place so future edits do not require the same bug-prone change in multiple blocks.

This exercise is inspired by `example_code/02-lif-correlation-analysis-live-student.qmd`, where similar analysis steps happen across multiple tissues. The teaching starter is much smaller so you can focus on the reuse decision itself.

This activity depends on the readability habits from Day 1. Once the workflow is understandable, the repeated pieces become easier to see and refactor.

## Files

- starter code: `starter.R` or `starter.py`
- example approach: `example.R` or `example.py`

### Task

Read the starter script and look for repeated work that should happen in one place instead of many places.

1. Read the script once without editing.
2. Highlight repeated filtering, averaging, and formatting steps.
3. Extract one or two small functions.
4. Replace the repeated blocks with function calls.

### Hints

- A good first function usually does one repeated calculation.
- A second function can help format output for printing.
- Keep the first version simple. You do not need to build a perfect abstraction.
- If you are unsure where to start, look for repeated work that only changes by tissue name or threshold.

### What to Preserve

- the same tissues
- the same strong-gene counts, top partners, and average values
- the same printed summaries

### Suggested Pace

- `5 minutes`: read and mark repeated patterns
- `15 minutes`: extract one useful function
- `10 minutes`: clean up names and replace repeated blocks

## Optional Discussion Prompt

If you finish early, discuss:

- which function gave you the biggest reduction in repetition?
- what repetition did you decide not to abstract yet?
- where would adding more abstraction start to hurt readability?
- if this grew into a notebook with six tissues instead of three examples, what would you want the reusable part to look like?
