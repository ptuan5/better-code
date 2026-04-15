# Syllabus

## Course Title

Better Code, Better Science: Next Steps in R & Python Practices

## Instructor

Tuan Nguyen

## Course Description

This 5-day workshop introduces practical coding habits that make research code easier to read, reuse, rerun, review, and share. The course is designed for researchers who already have some experience in either R or Python and want to improve how they structure and communicate their work.

Each day centers on one theme and follows the same rhythm:

- 75 minutes of concept, demo, and guided practice
- 15 minute break
- 60 minutes of a second activity, discussion, and wrap-up

The workshop emphasizes discussion and hands-on cleanup of small code examples rather than long lectures. Participants work with messy starter files, improve them in either R or Python, compare tradeoffs, and reflect on how those choices affect real scientific workflows.

## Target Audience

- researchers with some prior experience in R or Python
- learners who already write scripts or notebooks and want stronger coding habits
- participants interested in making analysis code easier to maintain and share

## Learning Objectives

By the end of the workshop, participants should be able to:

1. Write clear, readable, and well-documented code.
2. Refactor repeated code into reusable functions.
3. Make analysis workflows more reproducible.
4. Review code critically and test important logic.
5. Organize work so it is easier to share with others.

## Teaching Format

Each module includes:

- a short concept introduction
- a compact demo
- one or two hands-on cleanup activities
- group discussion and debrief
- parallel R and Python starter files plus example solutions

## Daily Outline

### Day 1: Readable

Theme: Write code you will understand six months later.

Topics:

- readable folder and project structure
- clear naming
- comments and docstrings
- readability as a collaboration tool

Practice:

- organize a messy directory
- rewrite a confusing script for clarity

### Day 2: Reusable

Theme: Don't repeat yourself: functions are your friend.

Topics:

- spotting repetition and code smells
- turning repeated steps into functions
- choosing good inputs and outputs
- notebook parameterization

Practice:

- break repeated logic into smaller functions
- clean up a notebook template by moving parameters to the top

### Day 3: Reproducible

Theme: Someone else, or future you, can rerun everything.

Topics:

- virtual environments and environment documentation
- hidden assumptions in scripts
- inputs, outputs, and run order
- turning interactive code into scripts

Practice:

- create a small conda environment and compare it with `renv` and `uv`
- write a runnable script with a clear entry point

### Day 4: Reliable

Theme: Reliable code deserves trust, not just execution.

Topics:

- why unreliable science is costly even when code does not crash
- a reliability triage: fix errors, debug wrong results, then probe edge cases
- common fragile assumptions in scientific code
- code review for data science versus software engineering
- simple tests in `pytest` or `testthat`

Practice:

- review and debug suspicious analysis code
- identify common edge cases before they become bugs
- write a few focused tests around important behavior

### Day 5: Shareable

Theme: Make your work usable by others.

Topics:

- what makes a repository understandable
- README essentials
- GitHub and pull request basics
- polishing code for handoff and reuse

Practice:

- improve a weak repository or script package
- review another participant's work and reflect on improvements

## Repository-Based Materials

The workshop repository is organized by day under `modules/`. Each module contains:

- `agenda.md`: the day schedule and activity flow
- `activities/`: learner prompts plus activity-specific R and Python materials

Instructor-facing notes live under `teaching/`, organized by day.

Course-wide planning documents live under `documents/`.

## Suggested References

- `https://github.com/jnguyen095/clean-code/blob/master/Clean.Code.A.Handbook.of.Agile.Software.Craftsmanship.pdf`
- `https://github.com/TheJacksonLaboratory/bestpractices_workshop`
- reproducible research resources for R, Python, and scientific workflows
