# Activity 2: Workshop Review Quiz

## Goal

Revisit the full workshop and connect the five course themes before the final wrap-up.

This is the synthesis checkpoint for the workshop: can you explain how code becomes understandable, reusable, rerunnable, trustworthy, and shareable?

This version uses only open-ended questions. The goal is not fast recall. The goal is to show judgment, tradeoff awareness, and concrete reasoning.

## Files

- your notes from Days 1-5
- any earlier activity file you want to use as an example

## Part A: Open-Ended Scenario Questions

Answer each in 2-4 sentences. Use a concrete example when possible.

### Readable

1. A collaborator opens your repo and understands the README, but the main script still uses names like `tmp1`, `tmp2`, and `final2`, with comments like `# loop through rows`. What would you change first, and why would that improve readability more than simply adding more comments?
2. Think of one script or notebook from this workshop. What is one place where a comment should explain a decision, assumption, or scientific choice rather than repeat the syntax?

### Reusable

3. Imagine you need to run the same workflow for three cohorts, where only the input file, cohort label, and output path change. How would you redesign that code so the logic stays in one place while the changing pieces stay easy to control?
4. Suppose you turned repeated code into a function, but now the function takes too many arguments and feels awkward to use. How would you tell whether the problem is the function design, the function scope, or the workflow around it?

### Reproducible

5. Someone clones your repo on a new machine and gets different results from yours on the same data. What are the first two or three things you would check, and why?
6. Describe a repo that looks polished but is still hard to reproduce. What signals would tell you that the workflow is fragile even before you run the code?

### Reliable

7. A script runs without errors and produces a plausible-looking result. What would you want to inspect before you trusted it, and what kind of wrong result could still slip through if you only checked that it ran?
8. A pull request changes both code structure and numerical logic, and an AI reviewer says it looks good. What additional evidence or checks would you want before merging?

### Shareable

9. You want collaborators to use a repo now, but you also want a stable version that could be cited later in a paper. How would you explain the different roles of Git, GitHub, and Zenodo in that workflow?
10. You are the only maintainer of a small repo. Why might you still choose a branch and pull request instead of pushing directly to `main`, and when might direct push still be reasonable?

## Part B: Synthesis Questions

Answer each in 3-5 sentences.

1. Choose one file from this workshop and describe one improvement for readability, one for reuse, and one for reproducibility. Which of those three would matter most to a future collaborator, and why?
2. Imagine you are reviewing a small pull request on a shared research repo. What should the branch name, commit message, and pull request description each communicate so the review is easier?
3. If AI review and a human helper gave different pull request comments, how would you decide which feedback to act on before merging?

## Reflection Prompt

- which question was hardest to answer well, and what made it difficult?
- where did you notice the strongest connection between two workshop themes?
- which workshop habit now feels most valuable for your own future collaborators?
- what is one practice from this week that you are most likely to keep using a month from now?
