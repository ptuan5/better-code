# Activity 1: Break This Code Into Smaller Functions

## Goal

Reduce repetition by turning repeated analysis steps into small, reusable functions.

## Files

- starter code: `r/starter.R` or `python/starter.py`
- example approach: `r/example.R` or `python/example.py`

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

## Optional Discussion Prompt

If you finish early, discuss:

- which function gave you the biggest reduction in repetition?
- what repetition did you decide not to abstract yet?
- where would adding more abstraction start to hurt readability?
