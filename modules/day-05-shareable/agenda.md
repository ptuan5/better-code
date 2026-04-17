# Day 5: Shareable

Theme: Make your work usable by others.

## Learning Goals

By the end of this module, participants should be able to:

1. Identify the basic parts of a usable research repository.
2. Explain the difference between Git, GitHub, and Zenodo.
3. Improve README files for audience, clarity, and actionability.
4. Complete a simple version-control workflow with commit, push, pull, and branching.
5. Explain how a pull request adds a review step before merging changes.
6. Connect shareability back to readability, reusability, reproducibility, and reliability.

## Materials

- `demos/publish-github-demo.md`
- `demos/pull-request-demo.md`
- `activities/activity-1/prompt.md`
- `activities/activity-1/`
- `activities/activity-2/prompt.md`

This day uses a mix of a tiny disposable practice repo and the actual workshop repo. The disposable repo keeps Git concepts small and clear, and the workshop repo makes the pull request and review workflow feel real.

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
- repeat the same ideas in VS Code and RStudio so learners can map the concepts to their IDE
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

- use the actual workshop repo for a live example of direct `pull` and `push`
- use `demos/pull-request-demo.md` to model a second small change moving through branch, pull request, review, and merge
- show how to inspect the diff on GitHub and leave one useful review comment
- demonstrate how AI review and one additional helper can support the review before merge
- explain why direct push is simpler, but pull requests add a clearer collaboration step

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

This module works well as a synthesis day. Invite participants to explain how readability, reusability, reproducibility, and reliability all support code sharing. Because the Git exercises are intentionally small, keep connecting them back to real repo habits rather than treating them as isolated commands.

The timing is reasonable if Activity 1 stays narrow. The success condition should be one small documented change plus one successful push and one successful pull, not a fully polished public repo.

If the cohort is small or not very responsive, use the quiz as the main reflection structure. The multiple-choice items can warm up the room, and the open-ended items can do the deeper synthesis work without needing a separate showcase.
