# Activity 1: Create, Push, and Pull a Practice GitHub Repo

## Goal

Create a tiny practice folder, connect it to GitHub, make a change, push it, and pull a change back down successfully.

## Scenario

You are starting a small project that you may want to share later.

Today is not about building a real analysis. It is about practicing the basic GitHub workflow on a very small example so the Git steps feel manageable:

- create a local project folder
- turn it into a Git repo
- connect it to GitHub
- make a change
- push that change
- pull a remote change back to your machine

Use either VS Code, RStudio, or the terminal for the workflow.

## Setup

Create a small practice folder with one or two simple files. For example:

- a `README.md` with one sentence about the project
- a short text file like `notes.txt`

Keep it tiny. The point is the workflow, not the content.

If you want a terminal starting point, you can use:

```bash
mkdir github-practice
cd github-practice
printf "# GitHub Practice\n\nA tiny repo for practicing push and pull.\n" > README.md
printf "first note\n" > notes.txt
git init
git add .
git commit -m "Create practice repo"
git branch -M main
```

## Task

1. Create a small local folder for practice.
2. Add at least one file, such as `README.md`.
3. Initialize Git in that folder.
4. Make the first commit with a clear message.
5. Create an empty GitHub repository.
6. Connect your local repo to that GitHub repo as a remote.
7. Push your local commit to GitHub.
8. Make one small local change, commit it, and push again.
9. Make one small remote change on GitHub, such as editing the README in the browser.
10. Pull that remote change back to your machine.
11. Confirm that your local folder now matches GitHub.

## What To Practice

- the difference between local Git and GitHub
- how `commit`, `push`, and `pull` relate to each other
- how small changes are easier to understand than large ones
- how a short README makes the repo easier to recognize on GitHub

## Questions to Answer

- what files did you create?
- what did your first commit save?
- what changed only after you pushed?
- what changed only after you pulled?
- what is the difference between `commit`, `push`, and `pull`?
- what part of the workflow still felt confusing?

## Discussion Prompt

- what was the smallest useful repo you could create?
- what part of connecting the local folder to GitHub felt easiest?
- what part of push or pull was most confusing the first time?
- what would you add next if this were becoming a real project?
