# Instructor Notes

## Session Goal

Move learners from ad hoc execution toward explicit, documented workflows.

Source inspiration: `example_code/GSbyModel_012126 - Tessa.R`

Course role: turn readable, reusable code into a workflow another person can rerun.

## Materials to Open

- `modules/day-03-reproducible/agenda.md`
- `modules/day-03-reproducible/demos/environment-notes.md`
- `modules/day-03-reproducible/demos/script-entrypoint.md`
- `modules/day-03-reproducible/activities/activity-1/prompt.md`
- `modules/day-03-reproducible/activities/activity-1/starter_environment.yml`
- `modules/day-03-reproducible/activities/activity-1/check_environment.R`
- `modules/day-03-reproducible/activities/activity-1/check_environment.py`
- `modules/day-03-reproducible/activities/activity-2/prompt.md`
- `modules/day-03-reproducible/demos/script-entrypoint.R` or `modules/day-03-reproducible/demos/script-entrypoint.py`
- `modules/day-03-reproducible/activities/activity-2/starter.R` or `modules/day-03-reproducible/activities/activity-2/starter.py`
- `modules/day-03-reproducible/activities/activity-2/example_solution.R` or `modules/day-03-reproducible/activities/activity-2/example_solution.py`

## Key Talking Points

- reproducibility depends on more than code alone
- hidden paths and undocumented assumptions create fragile workflows
- scripts should declare inputs, outputs, and execution order
- environment files and run instructions reduce guesswork
- `setwd()` plus a user-specific path is a useful example of why "it runs for me" is not enough

## Prompts

- What would another person need in order to rerun this analysis?
- Which assumptions in this script are invisible until it fails?
- How can we make the workflow steps explicit?

## Facilitation Tips

- Ask participants to list dependencies before they start editing.
- Keep the example small so discussion focuses on process, not tooling complexity.
- Emphasize that reproducibility starts with clear habits, even before formal pipelines.
- Use the original Tessa script as a quick reality check for what hidden assumptions look like in the wild.
- Keep connecting the day backward to reuse and forward to reliability: once a workflow is rerunnable, learners can start checking whether it is actually trustworthy.

## Debrief Questions

- What hidden dependency was most important to document?
- Which change made the workflow easiest to rerun?
- What would still need to be added for a real project?
- What part of the workflow would be easiest to forget if you returned to it in three months?
