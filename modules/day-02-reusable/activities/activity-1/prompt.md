# Activity 1: Break This Code Into Smaller Functions

## Goal

Reduce repetition by turning repeated analysis steps into small, reusable functions.

## Scenario

You want to investigate cachexia (wasting syndrome). You know that a gene named LIF (Leukemia Inhibitory Factor) encodesa cytokine implicated in this condition. Rather than looking at LIF expression in isolation, you want to know: **which genes move together with LIF across patients in multiple tissues?**

You inherit a short analysis script that works with gene expression data from 3 tissues: adipose, liver, and muscle (shared donors). 

Each tissue is stored in its own CSV file. The script repeats the same workflow for each tissue:

1. in each tissue, calculate the pairwise correlation between `LIF` and other genes
2. keep genes with correlation greater than `0.5` in all 3 tissues
3. plot the expression of `LIF` and the kept genes for each tissue

Each code chunk seems readable, but there are many repetitive patterns. Your job is to refactor that repeated work into smaller functions. 

This activity depends on the readability habits from Day 1. Once the workflow
is understandable, the repeated pieces become easier to see and refactor.

## Files

- starter code: `starter.R` or `starter.py`
- example approach: `example.R` or `example.py`
- input data: `mock_data_3_tissues/Adipose.csv`, `mock_data_3_tissues/Liver.csv`, `mock_data_3_tissues/Muscle.csv`

## Suggested Instructions

1. Read the script and summarize the overall workflow (make it readable).
2. Highlight repeated code chunks and turn them into functions.
3. Replace repeated codes with the function and confirm the output does not change
4. Think what should not be hard-coded.

## Discussion Prompt

- which function gave you the biggest reduction in repetition?
- what repetition did you decide not to abstract yet?
- where would adding more abstraction start to hurt readability?
- if this grew into a notebook with more tissues or a different target gene, what would you want the reusable part to look like?
