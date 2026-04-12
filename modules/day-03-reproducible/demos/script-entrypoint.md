# Script Entrypoint Demo

## Demo Goal

Show the difference between a script that only works for the author and a script another person can run on purpose.

## Scenario

Frame the demo like this:

A researcher wrote a quick script during exploratory work and kept adding to it over time. Now it contains a personal working directory, implicit inputs, and code that runs automatically at the bottom.

The demo asks learners to look at that script from the outside and identify what would stop a collaborator from running it reliably.

## Before

Use a starter pattern like this:

```r
setwd("/Users/name/Desktop/project")
library(dplyr)
data <- read.csv("models.csv")
output <- data |> subset(year >= 2021 & year <= 2023)
write.csv(output, "model_counts.csv", row.names = FALSE)
print("done")
```

Ask:

- What assumptions does this script make?
- What would break on another machine?
- Where is the intended entry point?

## Demo Moves

1. Remove user-specific paths.
2. Give the output file a clear location such as `results/model_counts.csv`.
3. Add a small `run_analysis()` or `main()` entry point.
4. Add one short note showing how to run the script.

## After

The improved version should make these items easy to identify:

- inputs
- year range
- output file path
- command to run

## Suggested Talking Points

- Reproducible scripts make assumptions visible.
- A script can be short and still need a clear entry point.
- "It works on my machine" usually means the setup is hidden in the code.
