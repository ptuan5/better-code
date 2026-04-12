# Activity 2: Reusable Analysis Notebook Template

## Goal

Make your refactor easier to reuse when the metric or label changes.

## Scenario

After your first cleanup, a teammate asks, "Could we use this same summary for a different tissue and maybe a different threshold too?" Your code is already less repetitive, but some values are still hard-coded in places that will make the next change awkward.

This activity asks you to decide what should become flexible now and what should stay fixed so the script is reusable without becoming overengineered.

In the original LIF notebook, the repeated workflow changes by tissue and by the object being summarized. In this teaching version, your job is to decide which values should be flexible and which ones should stay fixed.

This is also the bridge into Day 3: code with clearer parameters is usually much easier to rerun, document, and adapt across machines or projects.

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

- `tissue_name`
- `min_correlation`
- column names such as `correlation` or `mean_tpm`
- printed text such as `"top partner"` or `"average correlation"`
- the order in which summaries are displayed, if that matters to your design

## Success Check

By the end, another learner should be able to answer these questions quickly:

- where does the repeated logic live?
- what inputs does each function need?
- what changes if you summarize a different tissue or threshold?
- what stays fixed across the whole analysis?
- which parameter choices support real reuse rather than hypothetical future complexity?
