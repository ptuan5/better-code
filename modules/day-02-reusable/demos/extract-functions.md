# Extract Functions Demo

## Demo Goal

Show how to spot repeated work and pull one clear function out of it.

## Scenario

Use this framing:

A researcher duplicated the same summary pattern for three tissues because it was faster in the moment. Now the script is getting longer, and every small update means editing the same logic in several places.

The demo shows how to pause before the script grows further and extract one useful function that captures the repeated job.

## Starter Pattern

Use a short repeated workflow such as:

```text
for liver:
- filter rows
- count strong genes
- print top partner

for heart:
- filter rows
- count strong genes
- print top partner

for brain:
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

## Suggested Talking Points

- A good first function usually does one job.
- Reuse starts with repeated code you can already explain.
- It is fine to stop after one helpful function if the next abstraction would get muddy.
