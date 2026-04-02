# Syllabus

Source: `Syllabus for the Reproducible Programming in R_Python course.docx`

## Course Description

This workshop introduces good coding practices for scientific research. Aimed at researchers with some experience in either R or Python, it is structured around four key principles: readable, reusable, reliable, and reproducible. Each day focuses on one principle, exploring why it matters, what it entails, and how to implement it in practice through a combination of short lectures, demonstrations, and hands-on exercises. By the end, participants will be able to apply these principles to transform messy code into a cleaner workflow.

## Learning Objectives

1. Write clear, readable, and well-documented code within a structured project.
2. Design reusable functions and organize code for flexibility and scalability.
3. Convert exploratory notebooks into reproducible workflows.
4. Implement testing strategy for reliable results.
5. Share your code using GitHub for version control and collaboration.

## Course Outline

### Module 0: Prerequisites

- Support R/Python in RStudio, VS Code, and Jupyter Notebook
- Survey participant language and workflow preferences

### Module 1: Readable

- Course intro
- Organizing project directories
- Principles for readable code
- Naming, comments, docstrings, and linting

Hands-on ideas:

- Reorganize a project
- Practice rewriting confusing code

### Module 2: Reusable

- Functional programming
- Breaking down problems into tasks
- Refactoring repeated code into functions
- Notebook templates and parameterization

Hands-on ideas:

- Convert repeated code into a function
- Add parameters to a notebook

### Module 3: Reproducible

- Environment controls with conda and containers
- Turning scripts into executable tools
- Pipeline tools such as Snakemake

Hands-on ideas:

- Create and document a conda environment
- Convert an `.R` or `.py` file into a function

### Module 4: Reliable

- Code review workflow
- What to review and how to spot issues
- Automated testing with `testthat` or `pytest`

Hands-on ideas:

- Review problematic code
- Write simple unit tests

### Module 5: Shareable

- GitHub basics
- README best practices
- Pull requests for peer review
- Showcase and reflection

Hands-on ideas:

- Review each other's code in a mock PR
- Polish a final example for sharing

## Teaching Notes From Planning Document

- Use plain-language analogies before each concept to explain why it matters.
- Emphasize that code should be readable, organized, and not overly repetitive.
- Treat programming as learning a language: vocabulary plus grammar.
- Keep code chunks short and approachable when possible.
- Use a pre-survey and lightweight status signals to manage the room.
- Consider pseudo-code and domain-transferable logic instead of domain-specific detail.

## Candidate References

- `https://github.com/TheJacksonLaboratory/bestpractices_workshop`
- `https://englianhu.wordpress.com/wp-content/uploads/2016/01/reproducible-research-with-r-and-studio-2nd-edition.pdf`
- `https://adv-r.hadley.nz/`
- "Testing R code with testthat"
