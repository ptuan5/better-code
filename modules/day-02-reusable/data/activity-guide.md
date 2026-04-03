# Activity Guide

Theme: Don't repeat yourself: functions are your friend.

## First 75 Minutes

### 1. Why Reuse Matters

Time: 15 minutes

- discuss repetition as a maintenance problem
- introduce common code smells such as copy-paste logic and long scripts

### 2. Concept and Demo: Write Functions

Time: 15 minutes

- walk through a repeated workflow
- show how to extract a small function with clear inputs and outputs

### 3. Activity 1: Break This Code Into Smaller Functions

Time: 30 minutes

1. Read `starter.R` or `starter.py` without editing.
2. Mark repeated calculations and formatting steps.
3. Extract one or two small functions.
4. Replace repeated blocks with function calls.

### 4. Discussion

Time: 15 minutes

- what did you choose to turn into a function?
- what repetition did you leave alone, and why?

## Break

Time: 15 minutes

## Final 60 Minutes

### 5. Concept and Demo: Parameters in Notebooks or Scripts

Time: 15 minutes

- explain why hard-coded paths and values reduce reuse
- show how parameterization can keep code flexible without overcomplicating it

### 6. Activity 2: Reusable Analysis Template

Time: 25 minutes

1. Revisit your refactor and identify the values that vary.
2. Turn those values into arguments or top-level parameters.
3. Explain what should remain fixed and what should remain editable.

### 7. Discussion

Time: 15 minutes

- which parameters improved reuse?
- which ones made the code harder to understand?

### 8. Wrap-Up

Time: 5 minutes

- summarize one refactoring principle to carry forward
- preview tomorrow's focus on reproducible execution
