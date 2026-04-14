# Activity 2: Write an Executable Script

## Goal

Turn a personal analysis script into an executable script with an explicit
input file and output file.

## Scenario

A collaborator gives you a function to generate plots. It works well interactively, and now you want to turn it into a standalone command-line tool.

Your task is not to rewrite the plotting logic. Instead, keep the starter code
mostly as it is and turn it into something a teammate could run directly from the
terminal.

## Files

- starter code: `starter.R` or `starter.py`
- input data: `mock_data/MasterOpioid.csv`
- example solution: `example_solution.R` or `example_solution.py`

## Suggested Instructions

1. Read `starter.R` or `starter.py` once without editing.
2. Keep the plotting logic the same, but remove the hard-coded run command at
   the bottom.
3. Add a command-line interface so the script can accept:
   - the same input arguments as the start code
   - an output PDF path
4. Test the functions
5. Add one short example command that shows how to run the script.

Focus on execution, not refactoring. The goal is to make the script runnable,
not to clean up every part of the starter code.

## Discussion Prompt

- when does it worth turn a script into an executable tool?
- what inputs and outputs should always be explicit in an analysis script?
- what still belongs in the environment setup, rather than inside the script?
