# Activity 2: Rewrite a Small Analysis Script for Readability

## Goal

Make a function easier to follow without changing what it calculates.

## Scenario

6 months ago, you wrote a function that compare transcriptomes between a control and a treatment group to identify significantly differentially expressed genes. 

Now, you want to do a similar analysis for a different project, but you have to make some changes to the code. You spent an afternoon tracing the code logic, and to save your future-self, you decide to rewrite the code with the same input, output, but make it readable.

## Files

- "your" current code: `starter.R` or `starter.py`
- input data: `simulated_expression_matrix.csv`
- example solution: `example_solution.R` or `example_solution.py`

## What the Script Does

The core of the starter script is the function `find_de_genes`, which does the following:

1. Take in a gene x sample expression matrix and an alpha threshold
2. Normalize the expression matrix by applying a `log2(x + 1)` transform
3. Loop through each gene, perform an independent t-test between Control and Treatment group
4. Adjust p-values for multiple hypothesis testing
5. Calculates group means and fold-change between the groups for each gene
7. Keep only significant genes (adjusted p-value < alpha), return p-value, fold-change and means of Control and Treatment group.

## Suggested Instructions

1. Read `starter.R` or `starter.py` once without editing.
2. Mark the places where you have to stop and figure out what an object means.
3. Rename the variables and/or add in-line comments 
4. Add a short script header that explains the purpose of the file and what it prints.
5. (optional) Improve the function logic to decrease redundancy, increase generalizability

Focus on readability and proper comments. The current function has lots of flaws, and readable code will help reveal these flaws.  

## Success Check

By the end, another learner should be able to answer these questions quickly:

- what does the function do?
- what is the input data, and what do the rows and columns represent?
- where is the per-gene statistical test run?
- where are the p-values adjusted?
- where are the fold-change calculated?

## Debrief Prompt

- which changes were clearly better?
- what comment was worth adding, and what comment would have been unnecessary?
- what would need to change next if this script grew into a longer analysis file?
