# Instructor Notes

## Session Goal

Move learners from ad hoc execution toward explicit, documented workflows.

## Key Talking Points

- reproducibility depends on more than code alone
- hidden paths and undocumented assumptions create fragile workflows
- scripts should declare inputs, outputs, and execution order
- environment files and run instructions reduce guesswork

## Prompts

- What would another person need in order to rerun this analysis?
- Which assumptions in this script are invisible until it fails?
- How can we make the workflow steps explicit?

## Facilitation Tips

- Ask participants to list dependencies before they start editing.
- Keep the example small so discussion focuses on process, not tooling complexity.
- Emphasize that reproducibility starts with clear habits, even before formal pipelines.

## Debrief Questions

- What hidden dependency was most important to document?
- Which change made the workflow easiest to rerun?
- What would still need to be added for a real project?
