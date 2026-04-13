# Activity 1: Break This Code Into Smaller Functions

## Goal

Reduce repetition by turning repeated analysis steps into small, reusable functions.

## Scenario

Imagine you inherit a short analysis script built from mock gene expression data.
The dataset includes 3 tissues, 100 genes, and 10 samples per tissue.

The script focuses on one target gene and repeats the same workflow for each
tissue:

1. pull the expression values for one tissue
2. calculate the correlation between the target gene and every other gene
3. keep the genes that pass a significance threshold
4. compare the tissue-level results to find genes that pass in all 3 tissues

The code works, but the same correlation, filtering, and comparison logic
appears over and over. Your job is to break that repeated workflow into smaller
functions before the script grows any further.

This activity depends on the readability habits from Day 1. Once the workflow
is understandable, the repeated pieces become easier to see and refactor.

## Files

- starter code: `starter.R` or `starter.py`
- example approach: `example.R` or `example.py`

## Task

Read the starter script and look for repeated work that should happen in one
place instead of many places.

1. Read the script once without editing.
2. Highlight repeated correlation, filtering, and comparison steps.
3. Extract one or two small functions.
4. Replace the repeated blocks with function calls.

For a 30-minute activity, extracting one solid function is enough. A second
function is optional if you still have time.

## Hints

- A good first function usually does one repeated calculation.
- A second function can help combine or summarize tissue-level results.
- Keep the first version simple. You do not need to build a perfect abstraction.
- If you are unsure where to start, look for code that only changes by tissue name.
- Because the dataset is mock data, focus on the refactor itself rather than data cleaning.

## What To Preserve

- the same target gene
- the same significance threshold
- the same set of significant genes found within each tissue
- the same final group of genes that pass the threshold in all 3 tissues

## Suggested Pace

- `5 minutes`: read and mark repeated patterns
- `15 minutes`: extract one useful function
- `10 minutes`: clean up names and replace repeated blocks

## Discussion Prompt

- which function gave you the biggest reduction in repetition?
- what repetition did you decide not to abstract yet?
- where would adding more abstraction start to hurt readability?
- if this grew into a notebook with more tissues or a different target gene, what would you want the reusable part to look like?
