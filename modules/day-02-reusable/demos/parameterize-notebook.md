# Parameterize Notebook

## Demo Goal

Show how a refactored function becomes more reusable when you place it inside an
analysis notebook with clear notebook-level parameters.

## Files

- `parameterize-notebook.Rmd`
- `parameterize-notebook.ipynb`
- optional config file: `config.yaml`

## Scenario

We wrote a function, `find_de_genes()`, that does the DE gene analysis.
Today we want to do the same analysis in a notebook, but with different datasets
and thresholds.

We do not want to rewrite the function in the notebook. We want to import it,
call it, and make the notebook reusable by exposing the values that change
between runs.

The notebook can keep those values directly near the top, or move them into a
small config file if we expect to rerun the same notebook often.

## Demo Moves

1. Reuse the function from `refactor_function.R` or `refactor_function.py`.
2. Move the values that vary to the top of the notebook.
3. Optionally load those values from `config.yaml`.
4. Let the notebook read like a short, rerunnable analysis.

## Example Refactor Shape

```text
run_de_analysis(data_path, alpha = 0.05)
```

Possible good parameters:

- `data_path`
- `alpha`
- optional config path if you want notebook settings outside the notebook

## Suggested Talking Points

- Importing a function is often better than copying it into a notebook.
- Good notebook parameters usually reflect the choices that vary between runs.
- A config file can help when the same notebook gets reused many times.
- The notebook should stay focused on inputs, outputs, and interpretation.
- A wrapper can improve reuse without hiding the core analysis.
