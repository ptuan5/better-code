# Activity 2: Write an Executable Script

## Goal

Make a small analysis runnable by someone else without hidden execution steps.

## Scenario

Assume the environment is now handled: a collaborator can install the required packages and open the project folder. The next problem is that the script itself may still hide file paths, execution order, and what should run first.

Your task is to turn that personal script into something a teammate could follow and run without needing the original author beside them.

Think of this as the smallest useful version of the information missing from the original `GSbyModel_012126 - Tessa.R` script.

This is also the handoff to Day 4: once another person can rerun the work, the next question becomes whether they should trust the results.

## Files

- starter code: `starter.R` or `starter.py`
- example approach: `example.R` or `example.py`

## Task

Inspect the starter script and make the workflow steps explicit.

1. Read the script once without editing.
2. List the hidden assumptions about paths, inputs, outputs, and execution order.
3. Rewrite the script so the analysis steps are easy to follow.
4. Make it clear what file gets written and where it goes.
5. Add one short note showing how a collaborator should run it.
6. Compare your version with the matching example file if time allows.

## Success Check

By the end, another learner should be able to answer these questions quickly:

- what command should someone run?
- what data goes into the script?
- what file comes out of the script?
- how would you run it from a clean folder?
- where does execution begin?
- what assumption from the original author have you now made explicit?

## Discussion Prompt

- which hidden assumption would have blocked a collaborator first?
- what change made the script feel most runnable from a clean folder?
- what run instruction was worth making explicit?
- what still feels fragile even after the cleanup?
- what information belongs in the script itself versus in a short note?
