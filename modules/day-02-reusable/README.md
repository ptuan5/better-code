# Day 2: Reusable

## Theme

Reduce repetition by turning repeated work into flexible, well-named functions.

## Learning Goals

By the end of this module, participants should be able to:

1. Spot repeated logic and common code smells.
2. Break a task into smaller, reusable pieces.
3. Refactor repeated code into functions with clear parameters.
4. Decide when parameterization helps and when it adds unnecessary complexity.

## Module Contents

- `agenda.md`: activity flow for the day's hands-on work
- `slide-outline.md`: compact slide plan for a short lesson
- `instructor-notes.md`: discussion points and facilitation guidance
- `activities/activity-1/prompt.md`: learner prompt for refactoring repeated code
- `activities/activity-1/r/starter.R` and `activities/activity-1/python/starter.py`: repeated workflows for learners to refactor
- `activities/activity-1/r/example.R` and `activities/activity-1/python/example.py`: one example approach for the refactor
- `activities/activity-2/prompt.md`: learner prompt for parameterizing the refactor

## Suggested Flow

1. Introduce DRY as a maintainability principle rather than a rigid rule.
2. Ask learners to identify repetition before they start rewriting code.
3. Refactor the starter files into functions with meaningful names and arguments.
4. Close with a discussion about good defaults, parameter choice, and overengineering.

## Teaching Notes

Keep the focus on making future changes easier. If learners rush toward abstraction too early, redirect them toward simple, concrete functions with one job each.
