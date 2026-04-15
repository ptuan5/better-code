# Activity 1: What Is Wrong With This Code?

## Goal

Practice reviewing code for bugs, edge cases, and hidden assumptions before trusting the output.

## Scenario

Imagine a collaborator sends you a helper function for comparing two bounding boxes from an image analysis workflow and says, "I think this IoU calculation is right now." The examples at the bottom look plausible, but you are not fully convinced because edge cases are exactly where this kind of code tends to fail.

Your job is to review the function like a careful scientific collaborator, not like someone trying to be impressed that it runs at all. Treat this as a code review first and a debugging exercise second.

This activity is inspired by `example_code/iou_calculation.py`. The teaching starter is intentionally smaller than the source example: one IoU function, one label helper, and a few hand-picked boxes. The core lesson stays the same: a function can look reasonable and still be wrong at the boundaries.

This activity builds on Day 3. A script that runs consistently is helpful, but reliability asks a harder question: does it produce the right result under normal and edge cases?

## Files

- starter code: `starter.R` or `starter.py`
- example approach: `example.R` or `example.py`

### Task

Review the starter script like a skeptical collaborator.

1. Read the script without editing.
2. Write down two or three review comments about behaviors that seem suspicious or fragile.
3. Decide which issue is a direct bug, which issue needs debugging, and which issue is an edge-case risk.
4. Fix the most important logic problems.
5. Run a few manual checks before comparing with the example approach.

### Places to Inspect

- whether boxes that only touch at an edge should count as overlap
- what happens when boxes do not overlap at all
- what happens when a box is invalid
- whether labels match the numeric result
- whether the function behavior is obvious from the name
- whether the examples at the bottom are enough to make you trust the function
- what assumptions this code makes about future inputs or future reuse

## Discussion Prompt

- which bug or fragile behavior felt most important to fix first?
- which box example made you trust the function less, and why?
- what edge case was easiest to miss at first glance?
- what review comment would have been most useful before editing?
- did the function name help or mislead you about the behavior?
- what review habit from this activity would you want to keep using?
