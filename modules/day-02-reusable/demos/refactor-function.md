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
3. adjust p-values
4. compute the group means and fold-change
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
- preprocess_data
    - log transformation
    - infer sample info from name
- compute statistics summary
    - perform t-test per gene
    - keep pvalues and group means
    - calculate fold-change
- adjust p-values
- filter the final results
```

Check `refactor-function.R` or `refactor-function.py` for the detailed implementation.

## Suggested Talking Points

- The main function should read like a short analysis outline.
- One helper can return several related values when they come from the same step.
- Not every block needs its own function; stop when readability improves.
