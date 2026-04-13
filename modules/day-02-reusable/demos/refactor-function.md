# Refactor Function Demo

## Demo Goal

Show how a function can be broken into smaller pieces once the
logic flow is clear.

## Files

- `refactor-function.R`
- `refactor-function.py`

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
3. keep the per-gene summary values
4. adjust p-values
5. assemble and filter the final results
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
compute_single_gene_stats(gene_data)
compute_gene_summaries(expression_long)
add_adjusted_pvalues(gene_summary)
find_de_genes(expression_matrix, alpha)
```

What each helper is doing:

- `prepare_expression_data()`: log transform, reshape, and infer group labels
- `compute_single_gene_stats()`: run one t-test and keep `pval`, group means, and fold change for one gene
- `compute_gene_summaries()`: repeat that helper across all genes and combine the results
- `add_adjusted_pvalues()`: apply BH correction after all per-gene tests are complete

Check `refactor-function.R` or `refactor-function.py` for the detailed implementation.

## Suggested Talking Points

- A useful function boundary often matches one stage of the workflow.
- The main function should read like a short analysis outline.
- One helper can return several related values when they come from the same step.
- Breaking code into chunks helps before parameterization even starts.
- Not every block needs its own function; stop when readability improves.
