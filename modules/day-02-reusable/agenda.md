# Day 2: Reusable

Theme: Don't repeat yourself: functions are your friend.

## Learning Goals

By the end of this module, participants should be able to:

1. Spot repeated logic and common code smells.
2. Break a task into smaller, reusable pieces.
3. Refactor repeated code into functions with clear parameters.
4. Decide when parameterization helps and when it adds unnecessary complexity.

## Materials

- `demos/refactor-function.md`
- `demos/refactor_function.R` or `demos/refactor_function.py`
- `demos/parameterize-notebook.md`
- `demos/parameterize-notebook.Rmd` or `demos/parameterize-notebook.ipynb`
- `activities/activity-1/prompt.md`
- `activities/activity-1/starter.R` or `activities/activity-1/starter.py`
- `activities/activity-1/example.R` or `activities/activity-1/example.py`
- `activities/activity-2/prompt.md`

This day uses teaching-sized starter files built around repeated workflow patterns.

## Agenda

### 1. Why Reusable & What It Entails

Time: 15 minutes

- discuss repetition as a maintenance problem
- introduce common code smells such as copy-paste logic and long scripts
- connect those smells to repeated analysis, ranking, and formatting steps that often grow across a script

### 2. Demo: Refactor Functions

Time: 15 minutes

- walk through the readable differential-expression workflow from Day 1
- use `demos/refactor-function.md` to model how one long function can be split into manageable chunks
- open `demos/refactor_function.R` or `demos/refactor_function.py`
- identify the main analysis stages inside `find_de_genes()`
- show how to extract small helper functions with clear inputs and outputs

### 3. Activity 1: Break This Code Into Smaller Functions

Time: 30 minutes

1. Open `activities/activity-1/prompt.md`.
2. Work from `activities/activity-1/starter.R` or `activities/activity-1/starter.py`.
3. Mark repeated calculations and formatting steps.
4. Extract one or two small functions.
5. Replace repeated blocks with function calls.

### 4. Discussion

Time: 15 minutes

- what did you choose to turn into a function?
- what repetition did you leave alone, and why?
- which function name made the workflow easiest to read?

## Break

Time: 15 minutes

### 5. Demo: Reuse Functions

Time: 15 minutes

- explain why hard-coded values reduce reuse
- open `demos/parameterize-notebook.Rmd` or `demos/parameterize-notebook.ipynb`
- use `demos/parameterize-notebook.md` to show when a hard-coded value should become a parameter
- connect this to the original notebook, where tissue name, target gene, and output labels are the pieces that vary
- show how parameterization can keep code flexible without overcomplicating it

### 6. Activity 2: Reusable Analysis Notebook Template

Time: 25 minutes

1. Open `activities/activity-2/prompt.md`.
2. Revisit your refactor and identify the values that vary.
3. Turn those values into arguments or top-level parameters.
4. Keep the abstraction simple enough that another learner could still follow it quickly.
5. Compare your version with `activities/activity-1/example.R` or `activities/activity-1/example.py` if time allows.

### 7. Discussion

Time: 15 minutes

- which parameters improved reuse?
- which ones made the code harder to understand?
- where did you stop abstracting on purpose?

### 8. Day Wrap Up / Buffer Time

Time: 5 minutes

- summarize one refactoring principle to carry forward
- preview tomorrow's focus on reproducible execution

## Notes

Keep the focus on making future changes easier. If learners rush toward abstraction too early, redirect them toward simple, concrete functions with one job each. The goal is not to rebuild the full LIF notebook, but to practice the habit of spotting and isolating repeatable work.
