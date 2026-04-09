# Activity Guide

Theme: Don't repeat yourself: functions are your friend.

### 1. Why Reusable & What It Entails

Time: 15 minutes

- discuss repetition as a maintenance problem
- introduce common code smells such as copy-paste logic and long scripts

### 2. Demo: Functions

Time: 15 minutes

- walk through a repeated workflow
- show how to extract a small function with clear inputs and outputs

### 3. Activity 1: Break This Code Into Smaller Functions

Time: 30 minutes

1. Open `data/activity.md`.
2. Work from `r/starter.R` or `python/starter.py`.
3. Mark repeated calculations and formatting steps.
4. Extract one or two small functions.
5. Replace repeated blocks with function calls.

### 4. Discussion

Time: 15 minutes

- what did you choose to turn into a function?
- what repetition did you leave alone, and why?

## Break

Time: 15 minutes

### 5. Demo: Reuse Functions

Time: 15 minutes

- explain why hard-coded paths and values reduce reuse
- show how parameterization can keep code flexible without overcomplicating it

### 6. Activity 2: Reusable Analysis Notebook Template

Time: 25 minutes

1. Revisit your refactor and identify the values that vary.
2. Turn those values into arguments or top-level parameters.
3. Use `data/activity.md` to decide which values should stay fixed and which should stay flexible.
4. Compare your version with `r/solution.R` or `python/solution.py` if time allows.

### 7. Discussion

Time: 15 minutes

- which parameters improved reuse?
- which ones made the code harder to understand?

### 8. Day Wrap Up / Buffer Time

Time: 5 minutes

- summarize one refactoring principle to carry forward
- preview tomorrow's focus on reproducible execution
