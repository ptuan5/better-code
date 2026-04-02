# Code Review Checklist

Use this during Day 4 peer review or mock pull request exercises.

## Correctness

- Does the code appear to do what the author claims?
- Are inputs and outputs clearly defined?
- Are edge cases handled or at least acknowledged?

## Readability

- Are names descriptive?
- Is the file organized into understandable sections?
- Are comments and docstrings helpful rather than redundant?

## Reusability

- Is repeated logic extracted into functions?
- Are important values parameterized instead of hard-coded?
- Can another user adapt this code without editing many lines?

## Reproducibility

- Are file paths, dependencies, and execution order documented?
- Can the workflow run from start to finish without hidden manual steps?
- Are environment requirements noted?

## Reliability

- Are there tests, assertions, or basic validation checks?
- What assumptions could fail silently?
- What parts of the code feel fragile?

## Shareability

- Does the repository explain how to run the code?
- Is the project structure understandable to a new user?
- Is there enough context for someone outside the original project?
