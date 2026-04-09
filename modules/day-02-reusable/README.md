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

- `data/instructor-notes.md`: discussion points and facilitation guidance
- `data/activity-guide.md`: activity flow for the day's hands-on work
- `data/activity.md`: learner prompt for the refactoring activities
- `data/slide-outline.md`: compact slide plan for a short lesson
- `r/starter.R`: repeated R workflow for learners to refactor
- `r/solution.R`: one function-based R reference solution
- `python/starter.py`: repeated Python workflow for learners to refactor
- `python/solution.py`: one function-based Python reference solution

## Suggested Flow

1. Introduce DRY as a maintainability principle rather than a rigid rule.
2. Ask learners to identify repetition before they start rewriting code.
3. Refactor the starter files into functions with meaningful names and arguments.
4. Close with a discussion about good defaults, parameter choice, and overengineering.

## Teaching Notes

Keep the focus on making future changes easier. If learners rush toward abstraction too early, redirect them toward simple, concrete functions with one job each.
