# Pull Request Demo

## Demo Goal

Show a live GitHub workflow on the actual workshop repo in this order:

1. push and pull directly on the workshop repo
2. create a branch for a second small change
3. open a pull request
4. review the pull request on GitHub
5. use AI and one additional helper to review before merging

The point is to show that learners may sometimes work directly on a shared repo, but branches and pull requests give a clearer review step before a change lands on `main`.

## Repo

Use the workshop repo itself for this demo.

Keep all edits small and low-risk. Good demo changes include:

- a clearer heading
- one improved README sentence
- one typo fix
- one short note added to a prompt or demo file

Avoid changes that would distract from the GitHub workflow.

## Part 1: Direct Push and Pull on the Workshop Repo

Start by showing the simplest shared workflow: make one tiny change directly on the workshop repo and sync it.

### Suggested Flow

1. Open the workshop repo locally.
2. Run `git pull` so learners see that you start by syncing with GitHub.
3. Make one very small edit on `main`.
4. Run `git status`.
5. Stage and commit the change.
6. Run `git push`.

### Suggested Commands

```bash
git pull
git status
git add <file>
git commit -m "Clarify workshop wording"
git push
```

### Talking Points

- `pull` brings remote changes down before you start.
- `commit` saves the change locally.
- `push` publishes that local commit to GitHub.
- Direct push is simple, but it removes the review step.
- For tiny trusted edits, direct push may be fine. For anything less obvious, a branch and pull request are safer.

## Part 2: Create a Branch for a Small Follow-Up Change

After the direct push/pull example, switch to a branch-based workflow.

### Goal

Show that the next small change does not need to go straight onto `main`.

### Suggested Flow

1. Start from the updated `main`.
2. Create a branch with a clear name.
3. Make one more small change.
4. Commit that change on the branch.
5. Push the branch to GitHub.

### Suggested Commands

```bash
git switch -c clarify-day5-demo
git status
git add <file>
git commit -m "Add small clarification for day 5 demo"
git push -u origin clarify-day5-demo
```

### Talking Points

- A branch is a separate line of work.
- The branch lets you propose the change without changing `main` yet.
- Branch names should describe the work.
- Small branches and small commits are easier to review.

## Part 3: Open a Pull Request

Once the branch is on GitHub, open a pull request into `main`.

### Suggested Flow

1. Open the branch on GitHub.
2. Click to open a pull request into `main`.
3. Write a short title and description.
4. Show the Files changed tab.
5. Point out that GitHub is now showing the proposed change as a reviewable diff.

### What To Emphasize

- A pull request is not just a merge button.
- It is a place to inspect, discuss, and improve a proposed change.
- The diff is easier to review than the whole repo at once.
- A small pull request is much easier to understand than a large one.

## Part 4: Review the Pull Request on GitHub

Walk through the review before merging.

### Suggested Flow

1. Read the pull request title and description out loud.
2. Review the diff file by file.
3. Ask whether the change is clear, scoped, and safe.
4. Leave one short review comment yourself.
5. Show how GitHub keeps the discussion attached to the exact line or file.

### Example Review Comment

```text
This wording is clearer, but I would still rename this heading so a new learner can tell what action to take first.
```

## Part 5: Use AI and One Additional Helper Before Merging

After your own quick review, show that GitHub review can be supported by helpers.

### Suggested Flow

1. Ask the AI reviewer to summarize or review the pull request.
2. Read the AI feedback with the class.
3. Show one additional helper review as well.
4. Compare the suggestions.
5. Decide which comments matter and which do not.
6. If needed, make one follow-up commit on the same branch.
7. Merge only after the review is complete.

### Talking Points

- AI can help spot risks, summarize changes, and suggest questions.
- AI review is helpful, but it does not replace judgment.
- A second helper is useful because different reviewers notice different things.
- Good review means deciding what feedback is actually relevant.
- Merge should come after review, not before it.

## Suggested Closing

End with this distinction:

- Direct push and pull are the simplest shared workflow.
- Branches create a safer place to make a change.
- Pull requests create a visible review step.
- AI can help with review, but the final decision is still yours.
