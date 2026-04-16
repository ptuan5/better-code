# Activity 2: Workshop Review Quiz

## Goal

Revisit the full workshop and connect the five course themes before the final wrap-up.

This is the synthesis checkpoint for the workshop: can you explain how code becomes understandable, reusable, rerunnable, trustworthy, and shareable?

This version is intentionally shorter, but it should still touch every workshop day so the whole review fits in 30 minutes.

## Files

- your notes from Days 1-5
- any earlier activity file you want to use as an example

## Multiple Choice

Work through these in order. The questions are grouped so the full quiz touches all five workshop themes.

### Readable

1. If a newcomer opens a small repo and has only one minute, what should they be able to figure out first?
   A. The project purpose and where to start
   B. Every package dependency from memory
   C. The full commit history
   D. Every implementation detail in the script
2. Which comment is usually most helpful in a scientific script?
   A. A comment that repeats each line of syntax
   B. A comment that explains the purpose of a step or a key assumption
   C. A comment that replaces the need for clear names
   D. A comment that lists every keyboard shortcut used to write the file

### Reusable

3. What is one sign that a chunk of code should probably become a function?
   A. It is long enough to fill the screen
   B. It repeats with only small changes
   C. It uses comments
   D. It appears near the top of a file
4. You run the same notebook three times with different tissues and output names. What change most improves reuse?
   A. Copy the notebook three times
   B. Turn the changing pieces into parameters
   C. Put the three tissue names in a comment
   D. Rename the output files by hand afterward

### Reproducible

5. What makes a script or notebook easier for another person to rerun on a different machine?
   A. More hidden setup steps
   B. A different folder structure every time
   C. Clear run instructions and environment setup
   D. Fewer file names
6. Which change most improves reproducibility?
   A. Replacing a personal file path with a project-relative path and a clear entry point
   B. Keeping a home-directory path so the original machine still works
   C. Running cells in whatever order seems convenient
   D. Assuming every package is already installed

### Reliable

7. Why is `it ran` not enough to trust a result?
   A. Running code is always slow
   B. Code can run and still return a plausible wrong answer
   C. Errors are the only real reliability problem
   D. A script that runs does not need testing
8. A script runs and the plot looks plausible, but you still feel uneasy. What is the best next step?
   A. Assume it is fine because there was no error
   B. Check intermediate values, edge cases, and the assumptions the code is making
   C. Add more colors to the plot
   D. Move the code into a different folder

### Shareable

9. What information belongs near the top of a README for a small analysis repo?
   A. A long biography of the author
   B. The project purpose, main file, and how to run it
   C. Every experiment the author has ever tried
   D. Only the output file name
10. What is the best description of Git, GitHub, and Zenodo?
   A. Git is for plotting, GitHub is for notebooks, Zenodo is for raw data
   B. Git is local version control, GitHub is hosting and collaboration, Zenodo is archival release and citation
   C. Git and GitHub are the same thing, and Zenodo replaces both
   D. GitHub is local version control, Git is a website, and Zenodo is a branch name

## Part B: Short Answer

Answer each in 1-2 sentences.

1. Readable: Name one change that improves readability without changing behavior.
2. Reusable: Name one repeated task from the workshop that should become a function or parameter, and say what would vary.
3. Reproducible: What environment note, run step, or file path decision would you document so someone else could rerun your work?
4. Reliable: What test, manual check, or review question would you want in place before trusting a result?
5. Shareable: What would you add to a repo handoff so a newcomer could use the project with less guesswork?

## Reflection Prompt

- which workshop theme felt easiest to answer from your own experience, and why?
- which theme still feels hardest to practice consistently?
- where did you notice the strongest connection between two workshop themes?
- what is one habit from the workshop you want future collaborators to notice in your work?
