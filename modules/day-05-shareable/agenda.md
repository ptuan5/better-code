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

- `demos/publish-github-demo.md`
- `demos/pull-request-demo.md`
- `activities/activity-1/prompt.md`
- `activities/activity-1/`
- `activities/activity-2/prompt.md`

This day uses a deliberately tiny practice repo rather than a direct real-world source file. It is meant to keep the Git and GitHub workflow small enough to practice clearly before participants apply it to their own projects.

## Agenda

### 1. Why Shareable & What It Entails

Time: 20 minutes

- discuss why code sharing is now a normal part of research and team workflows
- explain a minimum standard for sharing code: purpose, entry point, run steps, dependencies, outputs, and version history
- distinguish Git from GitHub and Zenodo
- discuss what makes code approachable to a new user
- connect sharing to the previous four course themes
- emphasize that sharing is usually a project-level communication problem, not only a code-style problem

### 2. Demo: Publish to GitHub with Git

Time: 30 minutes

- use `demos/publish-github-demo.md` to model local Git, remotes, GitHub, and branches in a small disposable folder
- show the difference between local history, a remote repo, and a GitHub-hosted repo
- demonstrate the same commit, push, and pull flow in both RStudio and VS Code
- keep the example intentionally tiny so the Git concepts stay visible

### 3. Activity 1: Create, Push, and Pull a Practice Repo

Time: 20 minutes

1. Open `activities/activity-1/prompt.md`.
2. Create a tiny local folder with a `README.md` and one other simple file.
3. Initialize Git and make the first commit locally.
4. Create an empty GitHub repo and connect it as a remote.
5. Push the local commit to GitHub.
6. Make one small remote change and pull it back down successfully.

### 4. Confirm Push/Pull and Troubleshoot

Time: 5 minutes

- confirm everyone has completed at least one successful push and one successful pull
- pause on the most common failure points: wrong branch, unsaved file, not staged, merge warning, authentication confusion

## Break

Time: 15 minutes

### 5. Demo: Pull Request Workflow

Time: 15 minutes

- use the practice repo created in Activity 1 as the repo for a small branch and pull request
- use `demos/pull-request-demo.md` to model one small change moving through branch, review, and merge
- show how to inspect a diff and leave one useful review comment
- explain how pull requests support collaboration once a repo is on GitHub
- if time allows, compare a small clean pull request with a messier one at a high level

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
