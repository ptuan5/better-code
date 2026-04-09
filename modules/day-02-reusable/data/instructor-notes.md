# Instructor Notes

## Session Goal

Show how small, well-scoped functions make code easier to change, test, and explain.

## Materials to Open

- `data/activity-guide.md`
- `data/activity.md`
- `r/starter.R` or `python/starter.py`
- `r/solution.R` or `python/solution.py`

## Key Talking Points

- repetition increases maintenance cost and risk
- functions create reusable building blocks
- a good function name can remove the need for a comment
- parameterization should support real variation, not hypothetical possibilities

## Prompts

- What repeated steps would be painful to update in five places?
- Which pieces of this task belong together as one function?
- What inputs should stay flexible, and what can safely remain fixed?

## Facilitation Tips

- Have learners highlight repetition before they start coding.
- Encourage them to write one useful function before several tiny ones.
- Point them toward obvious changing values such as treatment name, metric column, label, and unit.
- If a function is hard to name, the responsibility may still be unclear.

## Debrief Questions

- Which repeated pattern was easiest to turn into a function?
- Did any refactor make the code harder to follow?
- What tradeoff did you make between flexibility and simplicity?
