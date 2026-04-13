# Day 4: Reliable

Theme: Your code is wrong, so design for that.

## Learning Goals

By the end of this module, participants should be able to:

1. Review code for correctness, clarity, and hidden risk.
2. Distinguish between brittle code and trustworthy code.
3. Write a few focused tests for important logic.
4. Use peer review as a way to improve code quality and team learning.

## Materials

- `demos/edge-cases.md`
- `demos/test-cases.md`
- `activities/activity-1/prompt.md`
- `activities/activity-1/starter.R` or `activities/activity-1/starter.py`
- `activities/activity-1/example.R` or `activities/activity-1/example.py`
- `activities/activity-2/prompt.md`

This day centers on cases where two versions of the same idea behave differently and a plausible "correct" version can still hide bugs and missing imports.

## Agenda

### 1. Why Reliable & What It Entails

Time: 15 minutes

- discuss the difference between code that runs once and code that can be trusted
- introduce correctness, assumptions, and edge cases
- emphasize that review starts by questioning behavior, not admiring that the script runs

### 2. Demo: Think of Edge Cases

Time: 15 minutes

- show a small example with subtle bugs
- use `demos/edge-cases.md` to walk through normal, boundary, and invalid cases before editing code
- connect the demo to the broader idea that a plausible implementation can still give the wrong guarantee
- model how to inspect inputs and expected behavior before editing

### 3. Activity 1: What Is Wrong With This Code?

Time: 30 minutes

1. Open `activities/activity-1/prompt.md`.
2. Read `activities/activity-1/starter.R` or `activities/activity-1/starter.py` silently.
3. Mark possible bugs, hidden assumptions, and edge cases.
4. Fix the most important logic problems.
5. Do a few manual checks before comparing with the example approach.

### 4. Discussion

Time: 15 minutes

- which bugs were easiest to miss?
- what assumptions should reviewers question first?
- which behavior was ambiguous until you named an expected result?

## Break

Time: 15 minutes

### 5. Demo: Unit Tests

Time: 15 minutes

- explain the role of small, focused tests
- use `demos/test-cases.md` to turn one reliability question into a normal case, edge case, and failure case
- show normal, edge, and failure cases
- connect tests back to the kinds of hidden logic errors in the IoU example

### 6. Activity 2: Build Unit Tests With `pytest` or `testthat`

Time: 25 minutes

1. Open `activities/activity-2/prompt.md`.
2. Choose a normal case, an edge case, and a failure case.
3. Write two or three small tests.
4. Compare your checks with `activities/activity-1/example.R` or `activities/activity-1/example.py` if time allows.

### 7. Discussion

Time: 15 minutes

- what was worth testing?
- what felt unnecessary for this example?
- which test would you keep even if you had time to write only one?

### 8. Day Wrap Up / Buffer Time

Time: 5 minutes

- connect testing to review and future changes
- preview the final day on sharing and collaboration

## Notes

Participants do not need a full testing framework lecture here. A small number of meaningful tests is enough to show how reliability improves when assumptions become explicit. The big lesson is that "I wrote a more general version" is not the same thing as "I wrote a trustworthy version."
