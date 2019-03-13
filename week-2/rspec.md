# RSpec and general TDD stuff too

## Better specs (Rspec guidelines)

<http://www.betterspecs.org/#all>

Lots of best practice principles for RSpec

## Mocking

Lotta info here: <https://github.com/rspec/rspec-mocks>

### Doubles

Instead of testing ObjectA against an instance of ObjectB, I use a stand in (a stuntman if you like) for ObjectB instead. ObjectA doesn't know the difference, it simply treats the double as if were an instance of ObjectB, but it's not - it's a dummy that I've set up with static (and therefore not variable) values.

### Stubs

I want to test some behaviour of ObjectA, but during the execution of that behaviour, ObjectA calls a method on ObjectB. I don't need to test that the method on ObjectB gets called, but I do want to make sure that when it does, the method on ObjectB always returns a specific value.

### Mocks

I want to test some behaviour of ObjectA and, critically, during the execution of that behaviour, ObjectA must call a method on ObjectB with specific arguments. In my test, I don't particularly care what happens afterwards, but I want to test that in the code that is about to be executed the specific method is called with the correct arguments.

### Spies

I want to test some behaviour of ObjectA and, critially, during the execution of that behaviour, ObjectA must call a method on ObjectB with specific arguments (sound familiar?). In my test, I don't particularly care what else happened during the test, just that in the code that was just executed the specific method was called with the correct arguments.
