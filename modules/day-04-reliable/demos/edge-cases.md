# Edge Cases Demo

## Demo Goal

Show how to question a plausible function by checking normal, boundary, and invalid cases.

## Scenario

Use this framing:

A function has already been "fixed," and the author feels confident because the main example works. But in scientific code, confidence should come from checking the uncomfortable cases too: edges, empty overlap, and impossible inputs.

The demo models the habit of asking what the function should do before deciding whether the code is trustworthy.

## Example Cases

Use interval overlap as the live example:

| Case | Interval A | Interval B | What to ask |
|---|---|---|---|
| Normal overlap | `1-5` | `3-7` | Is the overlap counted correctly? |
| Touching boundary | `1-5` | `5-9` | Does touching count as overlap or not? |
| No overlap | `1-4` | `6-9` | Does the function return zero cleanly? |
| Invalid input | `8-3` | `1-4` | Does the function reject impossible intervals? |

## Demo Moves

1. Read the function name and ask what behavior it promises.
2. Test a normal case first.
3. Push on the exact boundary next.
4. Check whether invalid input is handled or ignored.

## Suggested Talking Points

- Reliability starts by making expected behavior explicit.
- The most revealing case is often the boundary, not the obvious example.
- A function that works once is not the same as a function you can trust.
