# Week 3 code review
*Date: Mon 18 Mar*  
*Coach: Katerina*

## How do you review code? Where do you start?

- Read the README for an overview
- Look at the commit history
- Run tests
- When you're peer reviewing there might be a specific skill you want to practice, so start by looking at abstraction, how they've written their tests...
- Behaviour not state

## How do you identify quick wins?

What are these?
- Class/method naming
- Short methods
- SRP
- Use tools:
  - Run a linter like Rubocop
  - Check test coverage

## Has this person aligned to a goal?

e.g. if you were looking for a review to show you've done good TDD you'll need to commit your git repo to show the stages of your TDD process, e.g. you write and pass each test, with good commit messages, and link to a particular commit which you think demonstrates your process.

### Good commit messages:

- Concise
- Specfiic

If you're committing a test you can usually use the name of the test as the commit message, e.g. 'adds dishes to menu'

Don't commit failing code! So write the tests and pass them before committing.