# Repo Handoff Demo

## Demo Goal

Show how a small project becomes easier to hand off when purpose, run steps, outputs, and version history are easy to spot.

This is also the place to clarify the basic sharing stack:

- Git tracks version history locally.
- GitHub hosts the repo and supports collaboration.
- Zenodo archives a release and can mint a DOI for citation.

## Files

Use the matching materials from either `../activities/activity-1/r/` or `../activities/activity-1/python/`:

- weak version: `README.md`, plus `starter.R` or `starter.py`
- stronger version: `README-example.md`, plus `example.R` or `example.py`

## Scenario

Frame the demo like this:

You have opened a small analysis repo from another lab after seeing it linked in a shared document. The work looks relevant to your own project, but you only have a few minutes to decide whether you can actually use it.

The demo focuses on the first impression of the repo: what you can understand before you even run the code, and what signals tell you whether the handoff will be smooth or frustrating.

## Minimum Shareable Standard

Even a tiny public repo should help a newcomer answer these questions:

- What is this project for?
- Which file should I open first?
- How do I run it?
- What output should I expect?
- What should Git track, and what should `.gitignore` hide?
- If this becomes part of a paper, do I want an archived release in Zenodo?

## Newcomer Scan

Ask learners to open the repo like a stranger and answer:

- What should I open first?
- What does this project do?
- What command should I run?
- Where will the result appear?

## Repo Structure Talking Points

- top-level `README.md` for orientation
- main script or notebook with a clear name
- output folder or results folder with readable file names
- notes that support the work without replacing the README
- `.gitignore` for files that should not be versioned, such as caches, temporary files, and machine-specific clutter

## Versioning Talking Points

- `commit` means "save a meaningful version in Git"
- `push` means "send your local commits to GitHub"
- `pull` means "bring remote changes from GitHub back to your machine"

## RStudio and VS Code Moves

Show the same tiny workflow in both tools:

1. edit one small file
2. view changed files
3. stage the change
4. write a commit message
5. push
6. pull

In RStudio, use the Git pane.

In VS Code, use the Source Control view.

## Weak Version Signals

- `README.md` is vague
- script purpose is not obvious
- outputs have unclear names
- notes and run steps are scattered across files

## Strong Version Signals

- README starts with one-sentence purpose
- first command to run is visible near the top
- output file is named and located clearly
- the main script and supporting notes are easy to distinguish

## Suggested Talking Points

- Sharing problems often appear before anyone runs the code.
- A newcomer should not have to guess where to start.
- Repo structure and README wording are part of the scientific handoff.
- GitHub is for collaboration and visibility during development.
- Zenodo is for stable archival release and citation.
- If time allows, compare one stronger and one weaker public repo at a high level and ask what a stranger can tell in 30 seconds.
