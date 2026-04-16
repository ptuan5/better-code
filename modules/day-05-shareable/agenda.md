# Day 5: Shareable

Theme: Make your work usable by others.

## Learning Goals

By the end of this module, participants should be able to:

1. Identify the basic parts of a usable research repository.
2. Explain the difference between Git, GitHub, and Zenodo.
3. Improve README files for audience, clarity, and actionability.
4. Complete a simple version-control workflow with commit, push, and pull.
5. Recognize what makes a repo easier or harder to hand off publicly.
6. Connect shareability back to readability, reusability, reproducibility, and reliability.

## Materials

- `demos/repo-handoff.md`
- `demos/newcomer-review.md`
- `activities/activity-1/prompt.md`
- `activities/activity-1/`
- `activities/activity-2/prompt.md`

This day uses a deliberately tiny teaching project rather than a direct real-world source file. It is meant to feel like the main script from a small analysis repo that still needs clearer documentation, cleaner handoff signals, and one successful GitHub sync.

## Agenda

### 1. Why Shareable & What It Entails

Time: 20 minutes

- discuss why code sharing is now a normal part of research and team workflows
- explain a minimum standard for sharing code: purpose, entry point, run steps, dependencies, outputs, and version history
- distinguish Git from GitHub and Zenodo
- discuss what makes code approachable to a new user
- connect sharing to the previous four course themes
- emphasize that sharing is usually a project-level communication problem, not only a code-style problem

### 2. Demo: GitHub, Repo Structure, and Basic Versioning

Time: 30 minutes

- review the role of a README, `.gitignore`, clear structure, and visible run instructions
- open the weak starter materials in `activities/activity-1/r/` or `activities/activity-1/python/`, such as `README.md`
- use `demos/repo-handoff.md` to model how a newcomer scans a small repo for purpose, run steps, and outputs
- compare them with `r/README-example.md` or `python/README-example.md`
- show how a tiny script becomes much easier to hand off once purpose, inputs, outputs, and run order are written down
- demonstrate the same commit, push, and pull flow in both RStudio and VS Code

### 3. Activity 1: Make One Push and One Pull

Time: 20 minutes

1. Open `activities/activity-1/prompt.md`.
2. Choose the `r/` or `python/` starter folder.
3. Make one small improvement that helps a newcomer.
4. Commit the change locally.
5. Push it to GitHub.
6. Pull one remote change back down successfully.

### 4. Confirm Push/Pull and Troubleshoot

Time: 5 minutes

- confirm everyone has completed at least one successful push and one successful pull
- pause on the most common failure points: wrong branch, unsaved file, not staged, merge warning, authentication confusion

## Break

Time: 15 minutes

### 5. Demo: Repo Handoff Checklist

Time: 15 minutes

- use the revised files in one language folder under `activities/activity-1/` as the thing being reviewed
- use `demos/newcomer-review.md` to model one thing that is already clear and one concrete blocker
- show how to compare the script, README, notes, and outputs against the checklist
- explain when GitHub is enough and when Zenodo is useful for an archived, citable release
- if time allows, compare one stronger and one weaker public repo at a high level

### 6. Activity 2: Workshop Review Quiz + Reflection

Time: 30 minutes

1. Open `activities/activity-2/prompt.md`.
2. Work through a shorter mixed quiz with quick multiple-choice checks and short reflection questions.
3. Review the answers together to reactivate the main ideas from the week.
4. Use the reflection questions to connect the five workshop themes to participants' own projects.

### 7. Workshop Wrap Up / Buffer Time

Time: 15 minutes

- summarize the link between readable, reusable, reproducible, reliable, and shareable code
- identify one practice participants will use next week
- revisit any quiz question that produced useful disagreement if time allows
- use remaining time for optional good-vs-bad public repo examples if the room is moving quickly

## Notes

This module works well as a synthesis day. Invite participants to explain how readability, reusability, reproducibility, and reliability all support code sharing. Because the project is intentionally tiny, keep pushing learners to think in repo-level terms anyway: what would a stranger need to know first?

The timing is reasonable if Activity 1 stays narrow. The success condition should be one small documented change plus one successful push and one successful pull, not a fully polished public repo.

If the cohort is small or not very responsive, use the quiz as the main reflection structure. The multiple-choice items can warm up the room, and the open-ended items can do the deeper synthesis work without needing a separate showcase.
