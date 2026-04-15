# Test Cases Demo

## Demo Goal

Show how to turn reliability questions into a few small, focused tests.

## Files

- `test-cases.R`
- `test-cases.py`

## Scenario

Frame the demo like this:

The team agrees that a function should handle normal, boundary, and invalid cases, but those expectations are still being discussed verbally. If nothing is written down as a test, the next edit may quietly change the behavior again.

This demo shows how a few small tests can act as a shared memory for what the function is supposed to do. It also reinforces a practical sequence: review the code, name the risky assumption, then turn that assumption into a test.

## Test Matrix

Use the matching R or Python demo file and draft three checks around one function:

| Test Type | Example | Why it matters |
|---|---|---|
| Normal case | clear overlap between two intervals | confirms the main behavior |
| Edge case | intervals touch at exactly one frame | forces a boundary decision |
| Failure case | end comes before start | checks invalid input handling |

## From Review Comment To Test

Model the translation explicitly:

- review question:
  "Do touching intervals count as overlap?"
- expected behavior:
  "Yes, touching at one frame counts as overlap of length 1."
- test:
  write one small check that makes that rule visible

If time allows, contrast one or two other review-to-test translations:

- "What if there are no overlapping frames?"
- "What if the interval is impossible?"
- "What if future code allows more inputs than the author expected?"

## Demo Moves

1. Write the expected result before writing the test.
2. Keep each test focused on one behavior.
3. Prefer three meaningful tests over many shallow ones.
4. Point out that `pytest` and `testthat` use different syntax but the same testing logic.

## Example Test Questions

- What result should a normal overlap return?
- What should happen at the exact boundary?
- Should invalid input raise an error, return `NA`, or fail another clear way?

## Suggested Talking Points

- Tests make hidden assumptions visible.
- The best first tests usually cover the main path, one edge, and one failure.
- A good first test often comes directly from the question you would ask in review.
- A small test suite can still raise trust in the code a lot.
