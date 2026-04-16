# Activity 2: Build Unit Tests

## Goal

Write a few small tests around the most important behavior in your cleaned function.

## Scenario

Suppose you fixed the function, but now another person in the lab wants to reuse it in a larger analysis. If the expected behavior still lives only in your head, the same mistakes may come back later.

This activity turns the most important assumptions into tests so future readers can see what behavior the function is supposed to guarantee. Start from the review questions you raised in Activity 1 and decide which ones are important enough to lock in with `pytest` or `testthat`.

Treat this as the testing step that the original IoU example needed in order to reveal its hidden assumptions sooner.

This is also the setup for Day 5: code becomes much easier to share when its expected behavior is clear enough for another person to review and trust.

## Files

- your cleaned version from `../activity-1/`
- example solution functions: `example_solution.R` or `example_solution.py` (or you can choose your own)
- example solution tests: `test_example_solution.R` or `test_example_solution.py`

## Task

Choose the most important behavior in the cleaned function and write small tests around it.

1. Pick one review question you most want future readers to understand.
2. Test a normal case.
3. Test an edge case or boundary case.
4. Test one failure case, invalid input, or future-expansion case.
5. Compare your checks with the matching example solution if time allows.

## Good Test Ideas

- two boxes with clear overlap
- two boxes that touch at exactly one edge
- two boxes with no overlap
- an invalid box where `x2 <= x1` or `y2 <= y1`
- a score that lands exactly on a label threshold
- a case where the function name suggests one behavior but the code implements another
- a future case that would matter if the function were reused in a larger workflow

## Discussion Prompt

- which test gave you the most confidence in the function?
- which behavior was important enough to test even in this small example?
- what edge case was hardest to turn into a clear test?
- what assumptions are now visible in the tests that were hidden before?
- what review question still is not captured in your tests?
- what important behavior still is not covered by your tests?
