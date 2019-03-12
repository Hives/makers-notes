# Week 2 notes

Contents:

- [Week 2 goals](#goals)
- [Pairing feedback](#pairing-feedback)

## Week 2 goals <a name='goals'></a>

By the end of the week all developers can:


1. Use all of week 1's skills (don't underestimate the importance of this)
2. Break one class into two classes that work together, while maintaining test coverage
3. Unit test classes in isolation using mocking
4. Explain some basic OO principles and tie them to high level concerns (e.g. ease of change)
5. Review another person's code and give them meaningful feedback

Some developers may notice they are completing the work easier than their peers and ease off the effort here. They should be identified and pushed to have their code reviewed to a professional standard to make best use of the time available.

## Code review

- I had 4 guard conditions on `airport.land` - do i really need to test in what priority they fire? So many tests!
- I was `puts`ing out confirmation messages as well as returning `self` from object methods. Means lots of garbage in test output. Is this a bad idea??
- "Dependency injection" wtf?
- Only double to remove dependency - don't isolate tests for methods within a class. You want as much behaviour of the class to be normal as possible.

## Weekly task - oyster cards

Monday:
- Gemfile.lock - wassat?
- How do you install Gemfile? bundle install or something?
- what is `gem 'rake'` in the Gemfile (not this project, but last week's)?
- what's the structure of a unit test?
- what's an example of a bad test description?
- what is a class constructor? is it different from `.initialize`?
- how can you test something that happens after an exception?
- rspec predicate matchers: <https://relishapp.com/rspec/rspec-expectations/v/3-3/docs/built-in-matchers/predicate-matchers>

## Pairing feedback <a name='pairing-feedback'/></a>

### Matvey Shuppe (Mon)

Didn't get none

### Jeremy Smith

Jeremy liked that I was using Rubocop to help write good code,  running it frequently as we were going along. He also appreciated me helping him get a Rubocop linter up and running in VS Code.

He liked how I was refactoring as we were going along, in particular grouping tests together into contexts to improve readbility of code and RSpec output.