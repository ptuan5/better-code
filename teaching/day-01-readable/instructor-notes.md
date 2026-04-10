# Instructor Notes

## Session Goal

Help participants see readability as an important scientific practice, not just a style preference.

Source inspiration: `example_code/lincRNA_2.R`

Course role: establish the baseline habits the rest of the week depends on.

## Materials to Open

- `modules/day-01-readable/agenda.md`
- `modules/day-01-readable/demos/folder-structure.md`
- `modules/day-01-readable/activities/activity-1/prompt.md`
- `modules/day-01-readable/activities/activity-2/prompt.md`
- `modules/day-01-readable/activities/activity-2/r/starter.R` or `modules/day-01-readable/activities/activity-2/python/starter.py`
- `modules/day-01-readable/activities/activity-2/r/example.R` or `modules/day-01-readable/activities/activity-2/python/example.py`

## Key Talking Points

Why readable?

- unreadable code slows down review, reuse, and debugging
- good structure reduces cognitive load before anyone reads a single line
- names and comments should explain intent, not repeat syntax
- readability improvements should preserve behavior whenever possible
- readability problems show up before correctness problems, because confusion often hides bugs later

Readable projects usually make three things easy to locate:

- source data
- active code
- outputs or results

## Demo Notes

### Folder Structure Demo

- Start with the messy tree in `modules/day-01-readable/demos/folder-structure.md`.
- Tie the tree back to the kinds of inputs and outputs in `example_code/lincRNA_2.R`, such as count tables, transformed objects, sample metadata, and figure files.
- Ask learners what feels risky or hard to navigate before proposing changes.
- Show two valid structures so the lesson stays focused on clarity, not one "correct" layout.

### Readable Code Demo

- Open `modules/day-01-readable/activities/activity-2/r/starter.R` or `modules/day-01-readable/activities/activity-2/python/starter.py` and read it once without editing.
- Explain that the starter is a teaching-sized stand-in for the readability problems in the longer `lincRNA_2.R` file.
- Ask learners to identify vague names, mixed responsibilities, and comments that are still missing.
- Model small changes first: better names, clearer output labels, and separating logic from printing.
- Leave some cleanup work undone so learners still have decisions to make during Activity 2.

## Prompts

- What makes a script easy to trust when you open it for the first time?
- Which is harder to fix later: poor naming, poor structure, or missing comments?
- When is a comment useful, and when is it just noise?

## Facilitation Tips

- Keep the folder-organization discussion light; the goal is clarity, not perfect taxonomy.
- Ask learners to annotate what feels confusing before they begin rewriting.
- Encourage them to rename variables and split long blocks before changing logic.
- Remind learners that readability changes should preserve the script's behavior.
- If groups diverge, use that as a discussion point rather than a correction.
- Keep naming the forward link: today makes tomorrow's refactoring and rerunability work easier.

## Debrief Questions

- What became easier to find after you reorganized the project?
- Which change improved readability the most?
- What cleanup choices felt subjective versus clearly beneficial?
- What would you adopt immediately in your own work?
- If the real script were 300 lines long, what readability problem would hurt the most?
