# Activity Guide

Theme: Someone else, or future you, can rerun everything.

## First 75 Minutes

### 1. Why Reproducibility Matters

Time: 15 minutes

- discuss why code breaks across machines and over time
- surface examples of missing packages, hidden paths, and undocumented steps

### 2. Concept and Demo: From Interactive Work to Scripts

Time: 15 minutes

- show the difference between ad hoc execution and a clear entry point
- highlight hidden assumptions in a small example

### 3. Activity 1: Write an Executable Script

Time: 30 minutes

1. Open `starter.R` or `starter.py`.
2. List assumptions about packages, paths, and execution order.
3. Rewrite the file so inputs, outputs, and run steps are explicit.
4. Add brief instructions for how to run it.

### 4. Discussion

Time: 15 minutes

- what assumptions were hardest to notice at first?
- what change made the script easiest to rerun?

## Break

Time: 15 minutes

## Final 60 Minutes

### 5. Concept and Demo: Environments

Time: 15 minutes

- explain why dependency tracking matters
- show what an environment file or dependency note should communicate

### 6. Activity 2: Reconstruct the Environment

Time: 25 minutes

1. Identify the packages your script depends on.
2. Write a minimal environment note or dependency list.
3. Describe the expected output of the script.

### 7. Discussion

Time: 15 minutes

- what would another researcher still need in order to rerun the work?
- what belongs in the script versus in documentation?

### 8. Wrap-Up

Time: 5 minutes

- summarize the minimum information needed for reproducibility
- preview tomorrow's focus on reliability and tests
