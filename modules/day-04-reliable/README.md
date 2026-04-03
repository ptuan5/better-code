# Day 4: Reliable

## Theme

Treat code as something to inspect, challenge, and test.

## Learning Goals

By the end of this module, participants should be able to:

1. Review code for correctness, clarity, and hidden risk.
2. Distinguish between brittle code and trustworthy code.
3. Write a few focused tests for important logic.
4. Use peer review as a way to improve code quality and team learning.

## Module Contents

- `data/instructor-notes.md`: discussion points and facilitation guidance
- `data/activity-guide.md`: activity flow for the day's hands-on work
- `data/slide-outline.md`: compact slide plan for a short lesson
- `r/starter.R`: R example with bugs and fragile assumptions
- `r/solution.R`: cleaned and tested R reference solution
- `python/starter.py`: Python example with bugs and fragile assumptions
- `python/solution.py`: cleaned and tested Python reference solution

## Suggested Flow

1. Introduce code review as a habit, not a last-minute gate.
2. Have learners inspect the starter files before they write any code.
3. Add a few small tests around the most important behavior.
4. Compare review findings and talk about what testing did and did not catch.

## Teaching Notes

Participants do not need a full testing framework lecture here. A small number of meaningful tests is enough to show how reliability improves when assumptions become explicit.
