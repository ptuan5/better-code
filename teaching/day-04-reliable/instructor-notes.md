# Instructor Notes

## Session Goal

Help participants practice skepticism in a constructive way through review and testing.

## Materials to Open

- `modules/day-04-reliable/agenda.md`
- `modules/day-04-reliable/activities/activity-1/prompt.md`
- `modules/day-04-reliable/activities/activity-2/prompt.md`
- `modules/day-04-reliable/activities/activity-1/r/starter.R` or `modules/day-04-reliable/activities/activity-1/python/starter.py`
- `modules/day-04-reliable/activities/activity-1/r/example.R` or `modules/day-04-reliable/activities/activity-1/python/example.py`

## Key Talking Points

- reliable code is not the same as code that merely runs once
- review should look for correctness, edge cases, and maintainability
- testing makes expectations explicit
- small tests around high-value logic often pay off quickly

## Prompts

- What behavior matters most in this function?
- Which inputs would expose a hidden bug?
- What should a reviewer question before approving this code?

## Facilitation Tips

- Start with a review mindset before introducing tests.
- Ask learners to predict failures before they run anything.
- Keep tests focused on behavior rather than implementation details.

## Debrief Questions

- Which bug was easiest to miss by inspection alone?
- What did the tests make clearer?
- Where would you add more tests in a real project?
