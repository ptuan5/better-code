# Instructor Notes

## Session Goal

Help participants see readability as an important scientific practice, not just a style preference.

Source inspiration: `example_code/lincRNA_2.R`

Course role: establish the baseline habits the rest of the week depends on.

Useful Clean Code themes for this day:

- Chapter 1: readable code is a speed and maintenance issue, not cosmetic cleanup
- Chapter 2: names should reveal intent and avoid vague status labels or noise words
- Chapter 4: comments should explain intent when needed, not decorate confusing code
- Chapter 5: formatting is part of communication, especially top-down flow and visual grouping

## Materials to Open

- `modules/day-01-readable/agenda.md`
- `modules/day-01-readable/demos/folder-structure.md`
- `modules/day-01-readable/activities/activity-1/prompt.md`
- `modules/day-01-readable/activities/activity-2/prompt.md`
- `modules/day-01-readable/activities/activity-2/starter.R` or `modules/day-01-readable/activities/activity-2/starter.py`
- `modules/day-01-readable/activities/activity-2/example_solution.R` or `modules/day-01-readable/activities/activity-2/example_solution.py`

## Key Talking Points

Why readable?

- unreadable code slows down review, reuse, and debugging
- readable code helps teams move faster because future changes cost less
- good structure reduces cognitive load before anyone reads a single line
- names should explain intent and make files, variables, and outputs searchable
- comments should explain intent, warnings, or consequences, not repeat syntax
- formatting and spacing should help readers follow the code top to bottom
- readability improvements should preserve behavior whenever possible
- readability problems show up before correctness problems, because confusion often hides bugs later

Readable projects usually make three things easy to locate:

- source data
- active code
- outputs or results

## Demo Notes

### Folder Structure Demo

- Start with the messy tree in `modules/day-01-readable/demos/folder-structure.md`.
- Ask learners what feels risky or hard to navigate before proposing changes.
- Show two valid structures so the lesson stays focused on clarity, not one "correct" layout.
- Point out that even a short file list becomes harder to scan when inputs, scripts, and outputs all sit together.

### Readable Code Demo

- Open `modules/day-01-readable/activities/activity-2/starter.R` or `modules/day-01-readable/activities/activity-2/starter.py` and read it once without editing.
- Ask learners to identify vague names, mixed responsibilities, comments that duplicate the code, and places where spacing hides separate ideas.
- Model small changes first: better names, clearer output labels, blank lines between concepts, and separating logic from printing.
- If a comment seems necessary, ask whether a better function name, variable name, or output label could replace it.
- Leave some cleanup work undone so learners still have decisions to make during Activity 2.

## Prompts

- What makes a script easy to trust when you open it for the first time?
- Which is harder to fix later: poor naming, poor structure, or missing comments?
- When is a comment useful, and when is it just noise?
- What does the top of the file tell you, and what details should appear lower down?

## Facilitation Tips

- Keep the folder-organization discussion light; the goal is clarity, not perfect taxonomy.
- Ask learners to annotate what feels confusing before they begin rewriting.
- Encourage them to rename variables and split long blocks before changing logic.
- Push them away from comments that narrate syntax and toward names that carry meaning.
- Use blank lines and section order as readability tools, not just cosmetic formatting.
- Remind learners that readability changes should preserve the script's behavior.
- If groups diverge, use that as a discussion point rather than a correction.
- Keep naming the forward link: today makes tomorrow's refactoring and rerunability work easier.

## Debrief Questions

- What became easier to find after you reorganized the project?
- Which change improved readability the most?
- What cleanup choices felt subjective versus clearly beneficial?
- What would you adopt immediately in your own work?
- If the real script were 300 lines long, what readability problem would hurt the most?
