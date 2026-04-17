# Publish GitHub Demo

## Demo Goal

Use a fresh disposable folder for this demo, not one of the course repos.

Teach the ideas in this order:

1. local Git history in one straight line
2. remote repositories and GitHub
3. branches
4. the same three ideas in VS Code and RStudio

The point is to separate the concepts clearly. Git comes first. GitHub comes after that. Branches come after both.

## Setup

Start in the terminal with a brand-new folder:

```bash
mkdir github-practice
cd github-practice
git init
```

If Git refuses to commit because the user identity is missing, set it once:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

If your Git installation still uses `master` as the default branch name, either keep that name throughout the demo or rename it to `main` after the first commit.

## Part 1: Local Git Only

Do this entire part without remotes and without branches.

### Goal

Show that Git is local version control and that a project can move backward and forward through one straight line of saved history.

### Terminal Demo

Create a file, change it a few times, and commit each meaningful step:

```bash
printf "# Demo Notes\n" > notes.md
git status
git add notes.md
git commit -m "Create notes file"

printf "\n## Git Question\nWhat should a new collaborator see first?\n" >> notes.md
git add notes.md
git commit -m "Add Git question"

printf "\n## Git Answer\nA clear start point and clear history.\n" >> notes.md
git add notes.md
git commit -m "Add Git answer"

git branch -M main
git log --oneline
git show HEAD
git show HEAD~1
git diff HEAD~1 HEAD
```

### Talking Points

- Git is working entirely on your own machine in this part.
- The history is one straight line of commits.
- `status` shows the current working state.
- `add` chooses what goes into the next snapshot.
- `commit` saves a meaningful version.
- `log`, `show`, and `diff` help you move through earlier and later versions of the same project history.
- `checkout` or `switch` can help you inspect earlier versions.
- No branches are needed yet. This is just one line of change over time.

## Part 2: Remote Repositories and GitHub

Only after local Git makes sense should you introduce remotes.

### Goal

Show that a remote is just another copy of a Git repository, and then explain that GitHub is a common hosted remote.

### Terminal Demo: Remote As A Concept

You can demonstrate the idea of a remote without using GitHub first:

```bash
cd ..
git init --bare github-practice-remote.git
cd github-practice
git remote add origin ../github-practice-remote.git
git remote -v
git push -u origin main
```

### Terminal Demo: Connect That Idea To GitHub

Once learners understand that `origin` is just a remote location, show the GitHub version of the same idea with a hosted URL:

```bash
git remote set-url origin https://github.com/<your-username>/github-practice.git
git remote -v
git push -u origin main
git fetch
git pull
```

Use a pre-created empty GitHub repository for the demo, or substitute any example GitHub URL you want to discuss.

### Talking Points

- A remote is not magic. It is another Git repository.
- `origin` is only a conventional name for that remote.
- GitHub is one place where the remote repository can live.
- Git still does the version-control work. GitHub adds hosting, visibility, and collaboration.
- `push` sends local commits to the remote.
- `fetch` checks the remote without changing local files.
- `pull` brings remote changes into the current local branch.

## Part 3: Branches

Only after learners understand local history and remotes should you introduce branches.

### Goal

Show that a branch is a second line of development, not just another commit in the same straight line.

### Terminal Demo

Create a branch, make one commit there, then return to `main` and compare the histories:

```bash
git switch -c add-run-notes
printf "# Run Notes\nExplain each command before typing it.\n" > run.md
git add run.md
git commit -m "Add run notes"

git switch main
printf "# Audience\nAssume no prior Git experience.\n" > audience.md
git add audience.md
git commit -m "Add audience note"

git log --oneline --decorate --graph --all
git merge add-run-notes
git branch -d add-run-notes
git log --oneline --decorate --graph --all
```

### Talking Points

- A branch is a named line of work.
- Branches let you try something without mixing it into `main` immediately.
- The first part of the demo was a straight line of history.
- This part introduces multiple lines of history and then a merge.
- On GitHub, branches are commonly used for collaboration and pull requests.

## VS Code Version

Repeat the same three ideas in VS Code after the terminal version so learners can map the concepts to the interface.

### 1. Local Git Only

- Open the demo folder in VS Code.
- Open the Source Control view.
- If needed, choose `Initialize Repository`.
- Edit `notes.md`.
- Review the diff in the Source Control view.
- Stage the change, write a commit message, and commit.
- Use the commit graph or file timeline to show earlier versus later versions.

### 2. Remote Repositories and GitHub

- Explain that VS Code is still using Git underneath the interface.
- Add or publish a remote repository.
- Show push, pull, or sync only after the remote exists.
- Connect the remote URL to the idea of GitHub as a hosted Git repository.

### 3. Branches

- Use the branch name in the status bar or the Git commands in the Command Palette.
- Create a branch.
- Commit one small change on that branch.
- Switch back to `main`.
- Show that the branch keeps its own history until you merge it.

## RStudio Version

Repeat the same three ideas again in RStudio so learners can see the same Git concepts in a second IDE.

### 1. Local Git Only

- Open the demo folder as an RStudio Project.
- If Git is not yet enabled for the project, use `Project Options -> Version Control -> Git`.
- Edit `notes.md` or another small text file.
- Use the Git pane to inspect changes, stage files, commit, and open History.
- Emphasize that the underlying Git history is the same history you saw in the terminal.

### 2. Remote Repositories and GitHub

- If the remote is already configured, use the Push and Pull buttons in the Git pane.
- If the remote is not configured yet, add it once from the RStudio Terminal:

```bash
git remote add origin https://github.com/<your-username>/github-practice.git
git push -u origin main
```

- After that, use the Git pane to connect the idea of local Git to GitHub as the hosted remote.

### 3. Branches

- Use the branch selector in the Git pane to switch branches.
- Create or select a branch, make a small commit, and switch back.
- Use History to show that branches preserve separate lines of work.
- If needed, use the RStudio Terminal for the merge while keeping the Git pane visible.

## Suggested Closing

End with the simplest distinction possible:

- Git is local version control.
- A remote is another copy of the Git repository.
- GitHub is a hosted remote that makes sharing and collaboration easier.
- A branch is a separate line of work inside the same Git history.

If learners understand those four sentences, the handoff story is already much clearer.
