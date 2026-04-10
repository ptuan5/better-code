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

- `agenda.md`: activity flow for the day's hands-on work
- `slide-outline.md`: compact slide plan for a short lesson
- `instructor-notes.md`: discussion points and facilitation guidance
- `activities/activity-1/prompt.md`: learner prompt for making a script executable
- `activities/activity-1/r/starter.R` and `activities/activity-1/python/starter.py`: fragile workflows with hidden assumptions
- `activities/activity-1/r/example.R` and `activities/activity-1/python/example.py`: one example approach for a reproducible rewrite
- `activities/activity-2/prompt.md`: learner prompt for reconstructing the environment

## Suggested Flow

1. Start with examples of code that works only on one machine.
2. Identify hidden dependencies, missing documentation, and unclear run order.
3. Have learners rewrite the starter files so setup and execution are explicit.
4. Debrief by asking what information someone else would need to rerun the work.

## Teaching Notes

Participants often think reproducibility only means package management. Use this module to broaden that definition to include paths, inputs, outputs, execution order, and documentation.
