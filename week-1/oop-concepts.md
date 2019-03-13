# OOP Concepts

## S.O.L.I.D.

Good article: <https://thoughtbot.com/blog/back-to-basics-solid>

In OOP, SOLID is an acronym for five principles intended to make software design more readable, maintainable and flexible. SOLID principles were developed by [Robert C. Martin](https://en.wikipedia.org/wiki/Robert_C._Martin)

- S: [Single Responsibility Principle](#srp)
- O: [Open/Closed Principle](#open-closed)
- L: [Liskov Substitution Principle](#substitution)
- I: [Interface Segregation Principle](#segregation)
- D: [Dependency Inversion Principle](#dependency-inversion)

### <a name="srp">SRP - Single Responsibility Principle</a>

Basically, classes and methods should only do one thing. This helps keep classes and methods small, maintainable and easier to understand.

#### Classes

Classes should have responsibility for a single part of the functionality provided by the software. Robert C. Martin expresses this as "a class should only have one reason to change", which is a bit cryptic, but means this:

> Consider a module that compiles and prints a report. Imagine such a module can be changed for two reasons. First, the content of the report could change. Second, the format of the report could change. These two things change for very different causes; one substantive, and one cosmetic. The single responsibility principle says that these two aspects of the problem are really two separate responsibilities, and should therefore be in separate classes or modules.

#### Methods

We can apply SRP to methods too. The [example from the Boris Bikes exercise](https://github.com/makersacademy/course/blob/master/boris_bikes/15_single_responsibility_principle.md) was this code:

```ruby
def dock(bike)
    fail 'Docking station full' if @bikes.count >= 20
    @bikes << bike
end
```

Which both defines the docking station capacity, and also docks a bike. So it should be refactored.

The Ruby community style guide (the basis for Rubocop) says methods should not be longer than 10 lines of code, preferably no more than 5.

## <a name="open-closed">Open/Closed Principle</a>

Classes and methods should be "open for extension but closed for modification". This means open in the sense that functionality can be extended, but closed in the sense that it can be done without modifying the code. There's an example in the link at the top of the page.

## <a name="substitution">Liskov Substition Principle</a>

This is probably the hardest one to understand. It states that you should be able to replace any instance of a parent class with an instance of one of its children without creating any unexpected or incorrect behaviours.

## <a name="segregation">Interface Segregation Principle</a>

No client should be forced to depend on methods it does not use. So... if you're only using a subset of the interface, you should still be able to use it if some of the rest of it is broken? Or something?

## <a name="dependency-inversion">Dependency Inversion Principle</a>

High-level (e.g. business logic) objects should not depend on low-level (e.g. database querying and I/O) implementation details.

Here's a good article on this principle, specifically w.r.t. Ruby: <http://www.getlaura.com/dependency-inversion-principle-in-ruby/>