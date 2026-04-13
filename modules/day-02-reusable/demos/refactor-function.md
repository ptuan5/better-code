# Refactor Function Demo

## Demo Goal

Show how a function can be broken into smaller pieces once the
logic flow is clear.

## Files

- `extract-functions.R`
- `extract-functions.py`

## Scenario

Yesterday we rewrote `find_de_genes()` so another person could follow it.
Today we use that readable version to spot the next refactoring move.

The function is no longer mysterious, but it still does several different jobs
in one place. Before we make it more reusable, we can break the workflow into
manageable chunks.

## Logic Flow To Notice

The demo file uses the same differential-expression workflow from
`modules/day-01-readable/activities/activity-2/example_solution.R`, but now we
name the main stages:

```text
find_de_genes(expression_matrix, alpha)
1. prepare the expression data
2. run one t-test per gene
3. calculate group means and fold change
4. assemble and filter the final results
```

Ask:

- Which lines belong to the same job?
- Which chunk would be easiest to explain on its own?
- Where should the main function read like an outline instead of raw detail?
- Where does repetition happen?

## Demo Moves

1. Keep `find_de_genes()` as the high-level story of the analysis.
2. Extract helpers that match real workflow stages.
3. Pass only the data each helper needs.
4. Stop once the main function is easy to scan from top to bottom.

## Example Refactor Shape

```text
prepare_expression_data(expression_matrix)
compute_gene_pvalues(expression_long)
summarize_group_means(expression_long)
build_gene_results(pvalue_summary, mean_summary)
find_de_genes(expression_matrix, alpha)
```

Possible responsibilities:

- `prepare_expression_data()`: log transform, reshape, and infer group labels
- `compute_gene_pvalues()`: run the per-gene statistical test and adjust p-values
- `summarize_group_means()`: calculate group means and fold change
- `build_gene_results()`: merge the pieces and sort the output

## Suggested Talking Points

- A useful function boundary often matches one stage of the workflow.
- The main function should read like a short analysis outline.
- Breaking code into chunks helps before parameterization even starts.
- Not every block needs its own function; stop when readability improves.
