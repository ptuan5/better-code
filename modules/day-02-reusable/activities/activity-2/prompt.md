# Activity 2: Reusable Analysis Notebook Template

## Goal

Make your refactor easier to reuse by turning the right workflow values into parameters.

## Scenario

After your first cleanup, a teammate asks, "Could we run this on a different dataset or change the significance threshold without editing the function body?" Your code is already less repetitive, but some values are still hard-coded in places that will make the next run awkward.

This activity asks you to decide what should become flexible now and what should stay fixed so the workflow is reusable without becoming overengineered.

This is also the bridge into Day 3: code with clearer parameters is usually much easier to rerun, document, and adapt across machines or projects.

## Files

- your cleaned version from `../activity-1/`
- example approach: `../activity-1/example.R` or `../activity-1/example.py`
- template notebook: `template.Rmd` or `template.ipynb`

## Task

Take your refactor from Activity 1 and decide what should become a parameter.

1. Identify the values that vary between repeated blocks.
2. Open `template.Rmd` or `template.ipynb` and use it as a starting point.
3. Turn those values into function arguments or top-level parameters.
4. Decide what should stay fixed and what should stay flexible.
5. Compare your version with the matching example file if time allows.

## Good Candidates for Parameters

- `data_path`
- `alpha`
- `target_gene`, if your workflow supports changing it

## Values You Might Keep Fixed

- how the imported analysis function works internally
- how the data is reshaped
- how the statistical test is run
- how adjusted p-values are calculated

## Success Check

By the end, another learner should be able to answer these questions quickly:

- where does the repeated logic live?
- what inputs does each function need?
- what changes if you rerun the analysis with a different file or threshold?
- what stays fixed inside the analysis function?
- which parameter choices support real reuse rather than hypothetical future complexity?

## Discussion Prompt

- which parameter improved reuse the most?
- which value did you decide to keep fixed, and why?
- what was harder: deciding what to parameterize or what not to parameterize?
- did any parameter make the code more flexible but less readable?
- where did you stop abstracting on purpose?
