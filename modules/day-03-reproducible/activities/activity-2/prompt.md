# Activity 2: Reconstruct the Environment

## Goal

Document what another person would need in order to rerun the script from Activity 1.

## Scenario

Assume you cleaned the script itself, but now you need to hand it to a new lab member next month. They will not know which packages to install, what command to run, or what output file they should expect unless you write that down.

This activity focuses on the smallest useful note that would let someone else rerun the work without guesswork.

Think of this as the smallest useful version of the information missing from the original `GSbyModel_012126 - Tessa.R` script.

This is also the handoff to Day 4: once another person can rerun the work, the next question becomes whether they should trust the results.

## Files

- your cleaned version from `../activity-1/`
- example approach: `../activity-1/r/example.R` or `../activity-1/python/example.py`

## Task

Take your cleaned script and write the minimum notes needed for someone else to rerun it.

1. Identify the packages your script depends on.
2. Write a short environment note or dependency list.
3. Describe the expected output file and what it contains.
4. Compare your version with the matching example file if time allows.

## Success Check

By the end, another learner should be able to answer these questions quickly:

- what packages are required?
- what data goes into the script?
- what file comes out of the script?
- how would you run it from a clean folder?
- what assumption from the original author have you now made explicit?
