# Parameterize a Workflow Demo

## Demo Goal

Show how a useful function becomes more reusable when the right values become parameters.

## Scenario

Frame the demo like this:

Yesterday's refactor worked for one tissue, but now the team wants to run the same summary for other tissues and thresholds. The current function is cleaner than before, yet it still assumes one specific use case because important values are buried inside it.

The lesson here is not "parameterize everything." The lesson is to expose the values that truly vary in the real workflow.

## Before

Start from a function that still has hard-coded values inside it:

```text
summarize_liver(data)
- uses tissue = "liver"
- uses threshold = 0.70
- prints "top partner"
```

Ask:

- Which parts represent real variation?
- Which parts are stable enough to keep fixed?

## Demo Moves

1. Replace one hard-coded value at a time.
2. Prefer parameters tied to real reuse, not imaginary future flexibility.
3. Keep the function readable after parameterization.

## After

```text
summarize_tissue(data, tissue_name, min_correlation=0.70)
```

Possible good parameters:

- `tissue_name`
- `min_correlation`
- a label used in printed output

Possible overreach:

- parameterizing every column name before anyone needs that flexibility
- turning one simple summary into a generic function nobody can read quickly

## Suggested Talking Points

- Good parameters make the function adaptable without hiding its purpose.
- The best parameter list usually reflects real variation in the workflow.
- Reusability should support clarity, not fight it.
