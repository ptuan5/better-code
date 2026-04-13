# Extract Functions Demo

## Demo Goal

Show how to spot repeated work and pull one clear function out of it.

## Files

- `extract-functions.R`
- `extract-functions.py`

## Scenario

Use this framing while opening the matching R or Python demo file:

A researcher duplicated the same summary pattern for three tissues because it was faster in the moment. Now the script is getting longer, and every small update means editing the same logic in several places.

The demo shows how to pause before the script grows further and extract one useful function that captures the repeated job.

## Starter Pattern

The demo file uses the same mini LIF correlation table as Activity 1 and starts
with three repeated tissue summaries:

```text
for Adipose Subcutaneous:
- filter rows
- count strong genes
- print top partner

for Liver:
- filter rows
- count strong genes
- print top partner

for Muscle Skeletal:
- filter rows
- count strong genes
- print top partner
```

Ask:

- Which lines are truly repeated?
- Which value changes each time?
- What is the smallest useful function here?

## Demo Moves

1. Circle one repeated calculation first, not the whole script.
2. Name the function after the job it does, such as `summarize_tissue()`.
3. Give it only the inputs it actually needs.
4. Replace one repeated block with the function call before doing the rest.

## Example Refactor Shape

```text
summarize_tissue(data, tissue_name)
```

Possible responsibilities:

- filter the data to one tissue
- count strong genes
- identify the top partner
- return the summary values

You can then point learners to `activities/activity-1/example.R` or
`activities/activity-1/example.py` to show one reasonable endpoint after
the live refactor.

## Suggested Talking Points

- A good first function usually does one job.
- Reuse starts with repeated code you can already explain.
- It is fine to stop after one helpful function if the next abstraction would get muddy.
