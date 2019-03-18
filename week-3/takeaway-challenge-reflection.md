# Takeaway challenge reflection

<https://github.com/Hives/takeaway-challenge>

## TDD

I think my TDD process took a big step on with this project. I wrote feature tests which drove my unit tests - I wrote the feature test first, then wrote a unit test to produce the same error as the feature test, then wrote the minimal code to pass both failing tests. Then I repeated this until the feature test was passing. In this way I produced a series of unit tests which give good coverage of the feature.

The series of feature test failures also provide you a series of small steps you need to go through to implement the feature. Once I realised this it gave me more confidence that I could apply this method to break down any larger project into a series of small, manageable steps.

Comparing this with previous projects like the Airport and Oystercard challenges I think shows a big improvement in my method.

I should have made more regular git commits though, to demonstrate the application of the method.

## OOP principles

I think this piece of work demonstrates that I understand and can apply various OOP good practices:

- SRP: my classes have well-defined responsibilities, and my methods are well-named and focussed. In our code review Tomé said he found my code very easy to read for this readon.
- Open/closed: I tried to make my code open for extension, closed for modification. For instance the `Menu` class does have a default menu hard-coded in, but can be initialised with a different menu. This makes it more easily extensible, and also easier to test as menu test data can be injected.


## Testing behaviour not sate

I think I did a lot better, but it might be worth running this past a coach or my mentor to see what they think.

## Code review

Tomé said:
- He liked my README.md - very clear instructions on how to install and run the program
- He found my code very readable because of clear method names, and complex behaviour being refactored out into private methods
- He thought my tests reflected a good TDD practice