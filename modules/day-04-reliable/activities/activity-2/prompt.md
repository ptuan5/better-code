# Activity 2: Build Unit Tests

## Goal

Write a few small tests around the most important behavior in your cleaned function.

Treat this as the testing step that the original IoU example needed in order to reveal its hidden assumptions sooner.

This is also the setup for Day 5: code becomes much easier to share when its expected behavior is clear enough for another person to review and trust.

## Files

- your cleaned version from `../activity-1/`
- example approach: `../activity-1/r/example.R` or `../activity-1/python/example.py`

## Task

Choose the most important behavior in the cleaned function and write small tests around it.

1. Test a normal case.
2. Test an edge case.
3. Test one failure case or invalid input.
4. Compare your checks with the matching example file if time allows.

## Good Test Ideas

- two intervals with clear overlap
- two intervals that touch at exactly one frame
- two intervals with no overlap
- an invalid interval where the end comes before the start
- a case where the function name suggests one behavior but the code implements another
