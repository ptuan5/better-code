# Day 5: Shareable

Theme: Make your work usable by others.

## Learning Goals

By the end of this module, participants should be able to:

1. Identify the basic parts of a usable research repository.
2. Improve README files for audience, clarity, and actionability.
3. Explain a simple pull request workflow on GitHub.
4. Polish an example project for handoff, reuse, or public sharing.
5. Connect shareability back to readability, reusability, reproducibility, and reliability.

## Materials

- `demos/repo-handoff.md`
- `demos/newcomer-review.md`
- `activities/activity-1/prompt.md`
- `activities/activity-1/`
- `activities/activity-2/prompt.md`

This day uses a deliberately tiny teaching project rather than a direct real-world source file. It is meant to feel like the main script from a small analysis repo that still needs README help and a smoother handoff.

## Agenda

### 1. Why Shareable & What It Entails

Time: 15 minutes

- discuss what makes code approachable to a new user
- connect sharing to the previous four course themes
- emphasize that sharing is usually a project-level communication problem, not only a code-style problem

### 2. Demo: GitHub & Basic Repo Structure

Time: 15 minutes

- review the role of a README, clear structure, and visible run instructions
- open the weak starter materials in `activities/activity-1/r/` or `activities/activity-1/python/`, such as `README.md`
- use `demos/repo-handoff.md` to model how a newcomer scans a small repo for purpose, run steps, and outputs
- compare them with `r/README-example.md` or `python/README-example.md`
- show how a tiny script becomes much easier to hand off once purpose, inputs, outputs, and run order are written down

### 3. Activity 1: Fix This Repo & Publish to GitHub

Time: 25 minutes

1. Open `activities/activity-1/prompt.md`.
2. Inspect the tiny starter materials in either `activities/activity-1/r/` or `activities/activity-1/python/`.
3. Identify the most confusing parts across the script, README, notes, and output naming.
4. Rewrite headers, file names, or README-style guidance.
5. Make the project easier for another researcher to run or adapt.

### 4. Pull Request Concept and Handoff Checklist

Time: 20 minutes

- explain what a pull request is for
- show how a pull request description and short checklist clarify the handoff
- identify the top questions a newcomer should be able to answer before opening the code
- frame the review as a newcomer test: could I use this without asking you questions?

## Break

Time: 15 minutes

### 5. Demo: Review a Repo as a Newcomer

Time: 10 minutes

- model how to open a small repo and find the first file a newcomer should read
- use the revised files in one language folder under `activities/activity-1/` as the thing being reviewed
- use `demos/newcomer-review.md` to model one thing that is already clear and one concrete blocker
- show how to compare the script, README, notes, and outputs against the checklist
- demonstrate how the same newcomer check works as a self-review or whole-room review in a small cohort

### 6. Activity 2: Workshop Review Quiz + Reflection

Time: 40 minutes

1. Open `activities/activity-2/prompt.md`.
2. Work through a mixed quiz with quick multiple-choice checks and short open-ended reflection questions.
3. Review the multiple-choice answers together to reactivate the main ideas from the week.
4. Use the open-ended questions to connect the five workshop themes to participants' own projects.

### 7. Workshop Wrap Up / Buffer Time

Time: 10 minutes

- summarize the link between readable, reusable, reproducible, reliable, and shareable code
- identify one practice participants will use next week
- revisit any quiz question that produced useful disagreement if time allows

## Notes

This module works well as a synthesis day. Invite participants to explain how readability, reusability, reproducibility, and reliability all support code sharing. Because the project is intentionally tiny, keep pushing learners to think in repo-level terms anyway: what would a stranger need to know first?

If the cohort is small or not very responsive, use the quiz as the main reflection structure. The multiple-choice items can warm up the room, and the open-ended items can do the deeper synthesis work without needing a separate showcase.
