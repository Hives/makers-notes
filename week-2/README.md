# Week 2 notes

Contents:

- [Week 2 goals](#goals)
- [Weekly task - oyster cards](#oyster-cards)
- [Mocking](#mocking)
- [Pairing feedback](#pairing-feedback)

## <a name='goals'>Week 2 goals</a>

By the end of the week all developers can:


1. Use all of week 1's skills (don't underestimate the importance of this)
2. Break one class into two classes that work together, while maintaining test coverage
3. Unit test classes in isolation using mocking
4. Explain some basic OO principles and tie them to high level concerns (e.g. ease of change)
5. Review another person's code and give them meaningful feedback

Some developers may notice they are completing the work easier than their peers and ease off the effort here. They should be identified and pushed to have their code reviewed to a professional standard to make best use of the time available.

## <a name=oyster-cards>Weekly task - oyster cards</a>

Monday:
- Gemfile.lock - wassat?
- How do you install Gemfile? bundle install or something?
- what is `gem 'rake'` in the Gemfile (not this project, but last week's)?
- what's the structure of a unit test?
- what's an example of a bad test description?
- what is a class constructor? is it different from `.initialize`?
- Q: how can you test something that happens after an exception?
- rspec predicate matchers: <https://relishapp.com/rspec/rspec-expectations/v/3-3/docs/built-in-matchers/predicate-matchers>

## <a name=mocking>Mocking</a>

Lotta info here: <https://github.com/rspec/rspec-mocks>

### Doubles

Instead of testing ObjectA against an instance of ObjectB, I use a stand in (a stuntman if you like) for ObjectB instead. ObjectA doesn't know the difference, it simply treats the double as if were an instance of ObjectB, but it's not - it's a dummy that I've set up with static (and therefore not variable) values.

### Stubs

I want to test some behaviour of ObjectA, but during the execution of that behaviour, ObjectA calls a method on ObjectB. I don't need to test that the method on ObjectB gets called, but I do want to make sure that when it does, the method on ObjectB always returns a specific value.

### Mocks

I want to test some behaviour of ObjectA and, critically, during the execution of that behaviour, ObjectA must call a method on ObjectB with specific arguments. In my test, I don't particularly care what happens afterwards, but I want to test that in the code that is about to be executed the specific method is called with the correct arguments.

### Spies

I want to test some behaviour of ObjectA and, critially, during the execution of that behaviour, ObjectA must call a method on ObjectB with specific arguments (sound familiar?). In my test, I don't particularly care what else happened during the test, just that in the code that was just executed the specific method was called with the correct arguments.

## <a name='pairing-feedback'/>Pairing feedback</a>

### Matvey Shuppe (Mon)

Didn't get none

### Jeremy Smith (Tues)

Jeremy liked that I was using Rubocop to help write good code,  running it frequently as we were going along. He also appreciated me helping him get a Rubocop linter up and running in VS Code.

He liked how I was refactoring as we were going along, in particular grouping tests together into contexts to improve readbility of code and RSpec output.