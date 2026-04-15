# Instructor Notes

## Session Goal

Show how small, well-scoped functions make code easier to change, test, and explain.

Source inspiration: `example_code/02-lif-correlation-analysis-live-student.qmd`

Course role: show how readability turns into reusable structure.

## Materials to Open

- `modules/day-02-reusable/agenda.md`
- `modules/day-02-reusable/activities/activity-1/prompt.md`
- `modules/day-02-reusable/activities/activity-2/prompt.md`
- `modules/day-02-reusable/activities/activity-1/starter.R` or `modules/day-02-reusable/activities/activity-1/starter.py`
- `modules/day-02-reusable/activities/activity-1/example.R` or `modules/day-02-reusable/activities/activity-1/example.py`

## Key Talking Points

- repetition increases maintenance cost and risk
- functions create reusable building blocks
- a good function name can remove the need for a comment
- parameterization should support real variation, not hypothetical possibilities
- the original notebook repeats a meaningful scientific workflow across tissues, which is exactly the kind of repetition worth noticing

## Prompts

- What repeated steps would be painful to update in five places?
- Which pieces of this task belong together as one function?
- What inputs should stay flexible, and what can safely remain fixed?

## Facilitation Tips

- Have learners highlight repetition before they start coding.
- Encourage them to write one useful function before several tiny ones.
- Point them toward obvious changing values such as treatment name, metric column, label, and unit.
- If a function is hard to name, the responsibility may still be unclear.
- Remind them that the teaching example is smaller than the source notebook on purpose; the skill is noticing the reusable pattern, not reproducing the domain details.
- Tie the day backward to readability and forward to reproducibility: reusable code is easier to scan, rerun, and document.

## Debrief Questions

- Which repeated pattern was easiest to turn into a function?
- Did any refactor make the code harder to follow?
- What tradeoff did you make between flexibility and simplicity?
- What repeated notebook-style step would be painful to update in six places?
