# Day 4: Reliable

Theme: Reliable code deserves trust, not just execution.

## Learning Goals

By the end of this module, participants should be able to:

1. Explain why unreliable code is dangerous even when it appears to run correctly.
2. Triage reliability problems by separating crashes, wrong results, and untested edge cases.
3. Review code for correctness, assumptions, and hidden scientific risk.
4. Compare code review emphasis in data science and software engineering.
5. Write a few focused tests that lock in expected behavior.

## Materials

- `demos/edge-cases.md`
- `demos/edge-cases.R` or `demos/edge-cases.py`
- `demos/test-cases.md`
- `demos/test-cases.R` or `demos/test-cases.py`
- `activities/activity-1/prompt.md`
- `activities/activity-1/starter.R` or `activities/activity-1/starter.py`
- `activities/activity-1/example.R` or `activities/activity-1/example.py`
- `activities/activity-2/prompt.md`

This day centers on a simple but important idea: code can run, look plausible, and still be untrustworthy. The teaching arc starts with why that matters in science, then gives participants a practical workflow for reviewing suspicious code, debugging silent wrong behavior, and writing a few tests that preserve the intended behavior.

## Agenda

### 1. Motivation: Why Reliable Code Matters In Science

Time: 15 minutes

- contrast a loud failure with a silent wrong result
- connect unreliable code to wasted time, false confidence, and flawed scientific claims
- make the point that "it ran" is not the same as "it is trustworthy"
- frame reliability as a habit of checking behavior, assumptions, and future changes

### 2. Reliability Triage: Errors, Debugging, And Edge Cases

Time: 15 minutes

- introduce a simple workflow learners can reuse:
  - if the code errors, reproduce it, localize it, and fix it
  - if the code does not error but the result looks wrong, debug assumptions and intermediate values
  - if the code runs and the result matches expectation, still probe edge cases and future-use cases
- emphasize that reliability work is not only bug fixing
- name a few scientific-code edge-case families:
  - boundary and tie behavior
  - shape, axis, or grouping assumptions
  - empty, missing, or singleton inputs
  - "works for 2" but fails for `n`
  - duplicated summaries or plotting artifacts

### 3. Demo: Plausible Code, Hidden Assumptions

Time: 15 minutes

- open `demos/edge-cases.R` or `demos/edge-cases.py`
- use `demos/edge-cases.md` to walk through normal, boundary, and invalid cases before editing code
- show how a plausible function can still hide the wrong contract
- connect the live example to optional scientific examples:
  - smoothing along columns when the intent was to smooth along rows
  - boxplot plus jitter duplicating outliers
  - IoU logic that quietly assumes exactly two annotators
- model the habit of asking what behavior the code promises before deciding whether it is correct

### 4. Activity 1: Review And Debug Suspicious Code

Time: 20 minutes

1. Open `activities/activity-1/prompt.md`.
2. Read `activities/activity-1/starter.R` or `activities/activity-1/starter.py` silently.
3. Mark possible bugs, hidden assumptions, and edge cases as if leaving review comments.
4. Decide which issue is a direct bug and which issue needs debugging or clarification.
5. Fix the most important logic problems.
6. Do a few manual checks before comparing with the example approach.

### 5. Discussion: What Should Reviewers Question First?

Time: 10 minutes

- which problem was easiest to miss at first glance?
- which assumption mattered most for trust in the result?
- what question would you leave in a code review comment before approving this logic?

## Break

Time: 15 minutes

### 6. Mini-Lesson: Code Review In Data Science

Time: 15 minutes

- compare shared review concerns across fields:
  - naming, clarity, maintainability, and obvious bugs
- highlight what data science review often adds:
  - are the scientific assumptions explicit?
  - are grouping, units, orientation, and joins correct?
  - could missing data, outliers, or extra categories change the result?
  - is the visualization truthful, or just attractive?
- emphasize that DS review often includes checking whether the code supports the scientific claim, not only whether the code is well structured

### 7. Demo: Turn Review Questions Into Tests

Time: 15 minutes

- explain the role of small, focused tests
- open `demos/test-cases.R` or `demos/test-cases.py`
- use `demos/test-cases.md` to turn one review question into a normal case, an edge case, and a failure case
- show how `pytest` and `testthat` play the same conceptual role even if the syntax differs
- connect tests back to the kinds of hidden logic errors in the overlap and IoU examples

### 8. Activity 2: Write Focused Tests With `pytest` or `testthat`

Time: 20 minutes

1. Open `activities/activity-2/prompt.md`.
2. Choose one behavior you most want future you or a collaborator to trust.
3. Write a small test for the normal case, one for a boundary or edge case, and one for invalid input or future expansion.
4. Compare your checks with `activities/activity-1/example.R` or `activities/activity-1/example.py` if time allows.

### 9. Reliability Checklist, Discussion, And Wrap-Up

Time: 10 minutes

- what was most worth testing?
- which assumption should now be part of your review habit?
- what edge case would you check next in your own research code?
- preview Day 5 by framing tests and review as part of making code safer to share

## Notes

Participants do not need a full testing framework lecture here. A small number of meaningful tests is enough to show how reliability improves when assumptions become explicit.

If the room needs more examples, common reliability prompts include:

- what happens when there are zero rows, one row, or one group?
- what happens at exact boundaries or ties?
- what assumptions does this code make about sort order, axis, or grouping?
- what happens when a third annotator, a new category, or an extra batch appears?
- could the plotting layer accidentally duplicate or hide information?
- what behavior should fail loudly instead of returning a plausible number?

The big lesson is that "I wrote a more general version" is not the same as "I wrote a trustworthy version."
