# Activity 2: Workshop Review Quiz

## Goal

Revisit the full workshop and connect the five course themes before the final wrap-up.

This is the synthesis checkpoint for the workshop: can you explain how code becomes understandable, reusable, rerunnable, trustworthy, and shareable?

This version uses only open-ended questions. The goal is not fast recall. The goal is to show judgment, tradeoff awareness, and concrete reasoning.

## Files

- your notes from Days 1-5
- any earlier activity file you want to use as an example

## Questions

Look at the slides for day 5.

## Summary of the Workshop Key Points

- Communication starts with project structure, not just with code.
- Code should use meaningful variable names and meaningful comments.
- Functions should be small and focused. Always include a docstring that describes the purpose, inputs, and outputs.
- Make notebooks and scripts reusable. Use notebooks for reports and exploration, but use executable scripts or packages when you need a repeatable pipeline.
- We can manage environments at different levels. Use a container when the workflow is established and you want it to be truly portable and reproducible. Use conda for a shared environment across programming languages in day-to-day work. Use `uv` and `renv` for a more isolated single-project environment.
- When you write code, test it iteratively, think about potential pitfalls, and do not be afraid to discuss QC with your peers.
- Unit tests depend on your intent, not on how a function is implemented. You do not need to see the actual code to write unit tests.
- Share code on GitHub early, as long as you are comfortable with the visibility and use of the code, so you can track your work and make sharing easier.

