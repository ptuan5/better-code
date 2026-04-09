# Day 2 Activities

## Goal

Reduce repetition by turning repeated analysis steps into small, reusable functions.

## Files

- starter code: `r/starter.R` or `python/starter.py`
- reference solution: `r/solution.R` or `python/solution.py`

## Activity 1: Break This Code Into Smaller Functions

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

### What to Preserve

- the same treatment groups
- the same average values
- the same printed summaries

### Suggested Pace

- `5 minutes`: read and mark repeated patterns
- `15 minutes`: extract one useful function
- `10 minutes`: clean up names and replace repeated blocks

## Activity 2: Reusable Analysis Notebook Template

### Task

Take your refactor and make it easier to reuse when the metric or label changes.

1. Identify the values that vary between repeated blocks.
2. Turn those values into function arguments or top-level parameters.
3. Decide what should stay fixed and what should stay flexible.
4. Compare your version with the matching solution file if time allows.

### Good Candidates for Parameters

- `treatment_name`
- `value_column`
- printed label such as `"average height"` or `"average leaves"`
- optional unit such as `"cm"`

### Success Check

By the end, another learner should be able to answer these questions quickly:

- where does the repeated logic live?
- what inputs does each function need?
- what changes if you summarize a different column?
- what stays fixed across the whole analysis?

## Optional Discussion Prompt

If you finish early, discuss:

- which function gave you the biggest reduction in repetition?
- which parameter improved reuse the most?
- where would adding more abstraction start to hurt readability?
