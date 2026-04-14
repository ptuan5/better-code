# Script Entrypoint Demo

## Demo Goal

Show how to turn a reusable analysis workflow into an executable script with a
clear entry point and command-line flags.

## Files

- `script-entrypoint.R`
- `script-entrypoint.py`

## Scenario

Frame the demo like this:

We just spent time making the environment explicit. That solved one problem:
another person can now recreate the setup more reliably.

But even inside the correct environment, a messy script can still be hard to
run. We keep the same Day 2 Activity 1 correlation workflow, but now turn it
into an executable script.

We do not want analysis code that only works when someone opens it in an editor
and runs cells by hand. We want a script another person can run with a command
such as `Rscript ... --flags` or `python ... --flags`.

This first demo is about script structure, not package installation. The goal is
to make it obvious where execution starts and what the script expects to read and
write.

## Demo Moves

1. Wrap the Day 2 workflow in `run_analysis()` and `main()`.
2. Parse command-line flags instead of hard-coding key settings in the body.
3. Save outputs intentionally, including a shared-gene table and a PDF of plots.
4. Add one short example command showing how to run the script.

## After

The improved version should make these items easy to identify:

- input directory
- target gene
- correlation threshold
- correlation method
- output directory
- command to run

One reasonable endpoint is:

```text
main()
- parse --flags
- run the shared correlation analysis
- save shared_highly_correlated_genes.csv
- save shared_gene_expression.pdf
- print a short completion message
```

Example commands:

```bash
Rscript modules/day-03-reproducible/demos/script-entrypoint.R \
  --target-gene LIF \
  --correlation-threshold 0.5 \
  --output-dir modules/day-03-reproducible/demos/results
```

```bash
python modules/day-03-reproducible/demos/script-entrypoint.py \
  --target-gene LIF \
  --correlation-threshold 0.5 \
  --output-dir modules/day-03-reproducible/demos/results
```

## Suggested Talking Points

- A reusable workflow is not automatically a runnable script.
- A script entry point makes the intended starting place obvious.
- The script should not accidentally run when imported or sourced for some other purpose.
- Command-line flags make important settings visible without editing code.
- Reproducible scripts make inputs and outputs explicit.
- A clean entry point still does not solve missing runtime or package setup.
