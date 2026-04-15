# Edge Cases Demo

## Demo Goal

Show how to question a plausible function by checking normal, boundary, and invalid cases.

## Files

- `edge-cases.R`
- `edge-cases.py`

## Scenario

Use this framing:

A function has already been "fixed," and the author feels confident because the main example works. But in scientific code, confidence should come from checking the uncomfortable cases too: edges, empty overlap, impossible inputs, and cases the original author did not think about.

The demo models the habit of asking what the function should do before deciding whether the code is trustworthy.

## Example Cases

Use the matching R or Python demo file with interval overlap as the live example:

| Case | Interval A | Interval B | What to ask |
|---|---|---|---|
| Normal overlap | `1-5` | `3-7` | Is the overlap counted correctly? |
| Touching boundary | `1-5` | `5-9` | Does touching count as overlap or not? |
| No overlap | `1-4` | `6-9` | Does the function return zero cleanly? |
| Invalid input | `8-3` | `1-4` | Does the function reject impossible intervals? |

## Common Edge-Case Patterns To Name Out Loud

Use the overlap example as the live demo, then connect it to broader patterns that appear often in scientific code:

- boundary conventions:
  does touching count, or not?
- orientation or axis assumptions:
  are we smoothing across rows or across columns?
- plotting duplication:
  does a boxplot plus jitter layer accidentally show the same outlier twice?
- cardinality assumptions:
  does logic that works for two annotators break when a third annotator appears?
- empty or singleton inputs:
  what happens when a group has one row or no rows?
- invalid or unsorted input:
  should the code silently continue, or fail clearly?

## Demo Moves

1. Read the function name and ask what behavior it promises.
2. Test a normal case first.
3. Push on the exact boundary next.
4. Ask whether the code assumes a shape, axis, or number of inputs.
5. Check whether invalid input is handled or ignored.

## Suggested Talking Points

- Reliability starts by making expected behavior explicit.
- The most revealing case is often the boundary, not the obvious example.
- Many scientific bugs come from assumptions about shape, grouping, or cardinality rather than syntax errors.
- A function that works once is not the same as a function you can trust.
