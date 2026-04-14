# Activity 2: Reusable Analysis Notebook Template

## Goal

Turn your workflow into a reusable notebook template.

## Scenario

After activity 1 (find expression of genes correlated with *LIF*), you presented your analysis on LIF. The audience loves it, and they have a lot of suggestions.
- "The cutoff for the correlation coefficient is arbitrary. Have you tried other thresholds?" 
- "Recent studies found Gene_002 and Gene_003 to be interesting. Can you find correlated genes?"
- "Is the data normal? Have you tried non-parametric correlation methods?"

Your task is to rerun your pipeline with different parameters and save the
results (gene lists and expression plots) in notebooks.

Keep the dataset and overall workflow the same. The goal here is to explore the
results by changing a few meaningful parameters.

Suggested parameters to change:
- correlation threshold: `0.3` or `0.6`
- correlation type: `spearman`
- target gene: `Gene_002` or `Gene_003`

## Files

- your cleaned version from `../activity-1/`, or example approach: `../activity-1/example.R` or `../activity-1/example.py`
- template notebook: `template.Rmd` or `template.ipynb`
- helper file: `utils.R` or `utils.py`

## Suggested Instructions

1. Open `template.Rmd` or `template.ipynb`. (they are semi-filled)
2. Reuse the helper functions from Activity 1 (by put them in a separate `utils.R` or `utils.py` files then call them in the notebook).
3. Set notebook-level parameters near the top of the notebook.
4. Rerun the same workflow with different parameter values each time.
5. Save the outputs you want to compare across runs.

## Discussion Prompt

- what to parameterize or what not to parameterize?
- how do you store the results
