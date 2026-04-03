# Day 3: Reproducible

## Theme

Make code runnable on purpose, not by accident.

## Learning Goals

By the end of this module, participants should be able to:

1. Explain why workflows fail across machines and over time.
2. Record dependencies and execution steps clearly.
3. Turn ad hoc scripts into more deliberate, repeatable workflows.
4. Describe inputs, outputs, and run order for a small analysis task.

## Module Contents

- `data/instructor-notes.md`: discussion points and facilitation guidance
- `data/activity-guide.md`: activity flow for the day's hands-on work
- `data/slide-outline.md`: compact slide plan for a short lesson
- `r/starter.R`: fragile R workflow with hidden assumptions
- `r/solution.R`: one reproducible R reference solution
- `python/starter.py`: fragile Python workflow with hidden assumptions
- `python/solution.py`: one reproducible Python reference solution

## Suggested Flow

1. Start with examples of code that works only on one machine.
2. Identify hidden dependencies, missing documentation, and unclear run order.
3. Have learners rewrite the starter files so setup and execution are explicit.
4. Debrief by asking what information someone else would need to rerun the work.

## Teaching Notes

Participants often think reproducibility only means package management. Use this module to broaden that definition to include paths, inputs, outputs, execution order, and documentation.
