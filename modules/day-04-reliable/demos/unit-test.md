# Test Cases Demo

## Demo Goal

Show how to turn a silent-break suspicion into a few small, focused unit tests.

## Files

- `unit-test.R`
- `unit-test.py`

## Scenario

Frame the demo like this:

Demo 1a already gave you a review comment:
"This function says it smooths across rows, but I think it is smoothing across
columns instead."

Demo 2 shows how to turn that concern into tests. The point is not to write a
large suite. The point is to write a small number of checks that make the
expected behavior visible to future readers.

## Test Focus

Use the matching R or Python demo file to write tests for the moving-average
function from Demo 1a.

| Test Type | Example | Why it matters |
|---|---|---|
| Expected-output test | a toy matrix with an obvious row-wise pattern | catches the wrong axis directly |
| Structure test | a single-row matrix with `window = 1` | checks a simple input shape without extra moving parts |
| Failure test | `window` larger than the number of rows | makes error handling explicit |

## From Review Comment To Test

Model the translation explicitly:

- review question:
  "Are we averaging over time, or across samples?"
- expected behavior:
  "Each column should be smoothed down the rows because rows are time points."
- test:
  use a toy matrix where row-wise smoothing and column-wise smoothing produce
  different answers

If time allows, name one or two additional questions:

- "What should happen when there is only one row?"
- "What should happen when the window size is impossible?"
- "What behavior do we want to lock in before someone 'refactors' this later?"

## Demo Moves

1. Write the expected result before writing the first assertion.
2. Use one tiny matrix that makes the axis choice obvious.
3. Add one structure check and one error-handling check.
4. Run the tests and point out that a failing test is useful information, not a
   setback.
5. Highlight that `pytest` and `testthat` use different syntax but the same
   logic: arrange, assert, and make the contract visible.

## Example Test Questions

- Does the function smooth down rows, as promised?
- Does the simplest valid input keep its shape and values?
- Does an impossible window size fail clearly instead of returning a plausible
  matrix?

## Suggested Talking Points

- A good first test usually comes from a review comment.
- One revealing test is better than many shallow ones.
- Tests are a shared memory for expected behavior.
- Small tests make silent bugs much easier to discuss and fix.
