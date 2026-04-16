# Test Cases Demo

## Demo Goal

Show how to turn a silent-break suspicion into a few small, focused unit tests.

## Files

- `unit-test.R` (relying on `silent_break.R`)
- `unit-test.py` (relying on `silent_break.py`) 

## Scenario

Frame the demo like this:

Demo 1b already gave you a review comment:
"This helper looks useful, but do we know it works on a normal dataset, and do
we fail clearly when the time columns are malformed?"

Demo 2 shows how to turn that concern into tests. The point is not to write a large suite. The point is to write a small number of checks that make the expected behavior visible to future readers.

## Test Focus

Use the matching R or Python demo file to write tests for the
`_smooth_time_series()` helper from Demo 1b.

| Test Type | Example | Why it matters |
|---|---|---|
| Baseline test | a tiny dataset with evenly spaced time columns | confirms the helper returns the expected smoothed values |
| Failure test | a dataset with uneven time gaps like `0`, `2`, `3` | makes the time-spacing assumption explicit |

## From Review Comment To Test

Model the translation explicitly:

- review question:
  "What do we expect this helper to return on a normal dataset, and what should happen when time columns are malformed?"
- expected behavior:
  "The helper should smooth across time within each sample and reject unevenly spaced timepoints."
- test:
  use one tiny dataset with a known expected result, then one tiny dataset that
  should error

If time allows, name one or two additional questions:

- "Should the helper sort time columns before smoothing?"
- "Do we want an assertion, a warning, or a custom error for uneven spacing?"
- "What behavior do we want to lock in before someone 'refactors' this later?"

## Demo Moves

1. Write the expected baseline result before writing the first assertion.
2. Use one tiny dataset with evenly spaced columns.
3. Add one failure check for uneven timepoints.
4. Run the tests and point out that a failing test is useful information, not a
   setback.
5. Highlight that `pytest` and `testthat` use different syntax but the same
   logic: arrange, assert, and make the contract visible.

## Example Test Questions

- Does `_smooth_time_series()` return the expected smoothed values on normal input?
- Does it fail clearly when timepoints are not evenly spaced?

## Suggested Talking Points

- A good first test usually comes from a review comment.
- One revealing test is better than many shallow ones.
- Tests are a shared memory for expected behavior.
- Small tests make silent bugs much easier to discuss and fix.
