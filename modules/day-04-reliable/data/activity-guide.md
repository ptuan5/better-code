# Activity Guide

Theme: Your code is wrong, so design for that.

## First 75 Minutes

### 1. Why Reliability Matters

Time: 15 minutes

- discuss the difference between code that runs once and code that can be trusted
- introduce correctness, assumptions, and edge cases

### 2. Concept and Demo: Think About Edge Cases

Time: 15 minutes

- show a small example with subtle bugs
- model how to inspect inputs and expected behavior before editing

### 3. Activity 1: What Is Wrong With This Code?

Time: 30 minutes

1. Read `starter.R` or `starter.py` silently.
2. Mark possible bugs, hidden assumptions, and edge cases.
3. Fix the most important logic problems.
4. Do a few manual checks before comparing with the solution.

### 4. Discussion

Time: 15 minutes

- which bugs were easiest to miss?
- what assumptions should reviewers question first?

## Break

Time: 15 minutes

## Final 60 Minutes

### 5. Concept and Demo: Unit Tests

Time: 15 minutes

- explain the role of small, focused tests
- show normal, edge, and failure cases

### 6. Activity 2: Build Unit Tests With `pytest` or `testthat`

Time: 25 minutes

1. Choose the most important behavior in the cleaned function.
2. Write two or three small tests.
3. Include at least one edge case.

### 7. Discussion

Time: 15 minutes

- what was worth testing?
- what felt unnecessary for this example?

### 8. Wrap-Up

Time: 5 minutes

- connect testing to review and future changes
- preview the final day on sharing and collaboration
