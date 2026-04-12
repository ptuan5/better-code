# Readable Code Demo

## Demo Goal

Show how a short script becomes easier to scan when names, spacing, and comments work together.

## Scenario

Frame the demo like this:

A graduate student wrote a quick script late at night to label samples for follow-up plotting. The script technically works, but when they share it the next morning, nobody else can tell what `d`, `r`, `x`, and `y` mean without reading line by line.

The point of the demo is to show that readability problems start long before a script becomes large. Even a ten-line script can slow people down if the names and structure force guessing.

## Before

Use a small example like this in the live demo:

```python
d = [3, 9, 15]
r = []
# loop through data
for x in d:
    y = x / 3
    if y > 2:
        r.append("plot")
    else:
        r.append("check")
print(r)
```

Ask:

- What does each object hold?
- Where is the main decision in the script?
- Which comment helps, and which part still feels vague?

## Demo Moves

1. Rename `d`, `r`, `x`, and `y` so the data and result are obvious.
2. Separate calculation, labeling, and printing with blank lines.
3. Replace any comment that only narrates syntax with clearer code.
4. Add a short script header that says what the file produces.

## After

The cleaned version does not need to be long. It only needs to make the script's story obvious from top to bottom.

```python
measurement_values = [3, 9, 15]
priority_labels = []

for measurement_value in measurement_values:
    normalized_score = measurement_value / 3

    if normalized_score > 2:
        priority_labels.append("plot")
    else:
        priority_labels.append("check")

print(priority_labels)
```

## Suggested Talking Points

- Better names reduce the need for comments.
- Blank lines help readers see separate ideas.
- A short file can still be hard to read if everything is dense or vague.
- Readability changes should preserve behavior.
