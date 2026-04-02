# Better Code, Better Science

Workshop repository for the 5-day course "Better Code, Better Science: Next Steps in R & Python Practices" taught by Tuan Nguyen on April 13-17, 2026.

## Purpose

This repo is the single home for workshop materials, exercises, shared datasets, setup instructions, and instructor notes. It is designed so that participants can follow along day by day, while instructors can continue adding slides, notebooks, scripts, and solutions in a predictable structure.

## Learning Objectives

By the end of the workshop, participants should be able to:

1. Write clear, readable, and well-documented code within a structured project.
2. Design reusable functions and organize code for flexibility and scalability.
3. Convert exploratory notebooks into reproducible workflows.
4. Implement testing strategies for reliable results.
5. Share code using GitHub for version control and collaboration.

## Workshop Structure

- Day 0: Prerequisites and workflow setup
- Day 1: Readable code
- Day 2: Reusable code
- Day 3: Reproducible workflows
- Day 4: Reliable code
- Day 5: Shareable code

Each day has its own folder under [`days/`](/Users/nguyetu/Documents/Trainee/DS Fellow/BetterCode/days), with a short teaching plan, activity ideas, and placeholders for materials we will add.

## Repository Layout

```text
.
|-- days/
|   |-- day-00-prerequisites/
|   |-- day-01-readable/
|   |-- day-02-reusable/
|   |-- day-03-reproducible/
|   |-- day-04-reliable/
|   `-- day-05-shareable/
|-- docs/
|-- instructor/
|-- participant-setup/
|-- python/
|-- r/
`-- shared/
```

## What Goes Where

- [`days/`](/Users/nguyetu/Documents/Trainee/DS Fellow/BetterCode/days): day-by-day agendas, module outlines, and lesson-specific placeholders
- [`docs/`](/Users/nguyetu/Documents/Trainee/DS Fellow/BetterCode/docs): source material converted into markdown for version control
- [`instructor/`](/Users/nguyetu/Documents/Trainee/DS Fellow/BetterCode/instructor): facilitation notes, checklists, and teaching aids
- [`participant-setup/`](/Users/nguyetu/Documents/Trainee/DS Fellow/BetterCode/participant-setup): installation and onboarding instructions
- [`r/`](/Users/nguyetu/Documents/Trainee/DS Fellow/BetterCode/r): R-specific examples, exercises, and solutions
- [`python/`](/Users/nguyetu/Documents/Trainee/DS Fellow/BetterCode/python): Python-specific examples, exercises, and solutions
- [`shared/`](/Users/nguyetu/Documents/Trainee/DS Fellow/BetterCode/shared): language-agnostic datasets, templates, and starter materials

## Suggested Content Pattern

As we build the course, each day can follow the same lightweight pattern:

- `README.md`: daily overview, learning goals, module plan
- `slides/`: slide decks or speaker notes
- `activities/`: exercise instructions and starter files
- `solutions/`: instructor solutions
- `assets/`: images, sample data, or diagrams used that day

We do not need to create every folder immediately; the goal is to keep the structure predictable as materials are added.

## Day-by-Day Plan

- [`day-00-prerequisites`](/Users/nguyetu/Documents/Trainee/DS Fellow/BetterCode/days/day-00-prerequisites/README.md): language survey, tool support, environment setup
- [`day-01-readable`](/Users/nguyetu/Documents/Trainee/DS Fellow/BetterCode/days/day-01-readable/README.md): project organization, naming, comments, docstrings, linting
- [`day-02-reusable`](/Users/nguyetu/Documents/Trainee/DS Fellow/BetterCode/days/day-02-reusable/README.md): identifying repetition, writing functions, parameterizing notebooks
- [`day-03-reproducible`](/Users/nguyetu/Documents/Trainee/DS Fellow/BetterCode/days/day-03-reproducible/README.md): environments, scripts, and pipeline thinking
- [`day-04-reliable`](/Users/nguyetu/Documents/Trainee/DS Fellow/BetterCode/days/day-04-reliable/README.md): code review and testing
- [`day-05-shareable`](/Users/nguyetu/Documents/Trainee/DS Fellow/BetterCode/days/day-05-shareable/README.md): GitHub collaboration, README quality, and final polishing

## Source Documents

The original planning documents have been converted into markdown for easier review and editing:

- [`docs/syllabus.md`](/Users/nguyetu/Documents/Trainee/DS Fellow/BetterCode/docs/syllabus.md)
- [`docs/activity-breakdown.md`](/Users/nguyetu/Documents/Trainee/DS Fellow/BetterCode/docs/activity-breakdown.md)

## Immediate Next Steps

1. Add participant setup instructions for R, Python, VS Code, RStudio, and Jupyter.
2. Create one concrete starter exercise and one solution for each day.
3. Add a shared toy dataset used across multiple days so lessons build on each other.
4. Decide whether the repo should prioritize parallel R and Python tracks or a shared core with language-specific variants.
