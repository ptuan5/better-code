# Agenda

Theme: Your code is wrong, so design for that.

### 1. Why Reliable & What It Entails

Time: 15 minutes

- discuss the difference between code that runs once and code that can be trusted
- introduce correctness, assumptions, and edge cases

### 2. Demo: Think of Edge Cases

Time: 15 minutes

- show a small example with subtle bugs
- model how to inspect inputs and expected behavior before editing

### 3. Activity 1: What Is Wrong With This Code?

Time: 30 minutes

1. Open `activities/activity-1/prompt.md`.
2. Read `activities/activity-1/r/starter.R` or `activities/activity-1/python/starter.py` silently.
3. Mark possible bugs, hidden assumptions, and edge cases.
4. Fix the most important logic problems.
5. Do a few manual checks before comparing with the example approach.

### 4. Discussion

Time: 15 minutes

- which bugs were easiest to miss?
- what assumptions should reviewers question first?

## Break

Time: 15 minutes

### 5. Demo: Unit Tests

Time: 15 minutes

- explain the role of small, focused tests
- show normal, edge, and failure cases

### 6. Activity 2: Build Unit Tests With `pytest` or `testthat`

Time: 25 minutes

1. Open `activities/activity-2/prompt.md`.
2. Choose a normal case, an edge case, and a failure case.
3. Write two or three small tests.
4. Compare your checks with `activities/activity-1/r/example.R` or `activities/activity-1/python/example.py` if time allows.

### 7. Discussion

Time: 15 minutes

- what was worth testing?
- what felt unnecessary for this example?

### 8. Day Wrap Up / Buffer Time

Time: 5 minutes

- connect testing to review and future changes
- preview the final day on sharing and collaboration
