# Activity 2: Reusable Analysis Notebook Template

## Goal

Make your refactor easier to reuse when the metric or label changes.

## Files

- your cleaned version from `../activity-1/`
- example approach: `../activity-1/r/example.R` or `../activity-1/python/example.py`

## Task

Take your refactor from Activity 1 and decide what should become a parameter.

1. Identify the values that vary between repeated blocks.
2. Turn those values into function arguments or top-level parameters.
3. Decide what should stay fixed and what should stay flexible.
4. Compare your version with the matching example file if time allows.

## Good Candidates for Parameters

- `treatment_name`
- `value_column`
- printed label such as `"average height"` or `"average leaves"`
- optional unit such as `"cm"`

## Success Check

By the end, another learner should be able to answer these questions quickly:

- where does the repeated logic live?
- what inputs does each function need?
- what changes if you summarize a different column?
- what stays fixed across the whole analysis?
