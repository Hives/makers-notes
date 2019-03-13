# More OOP concepts

## Extracting classes

> You might have heard that classes should have a single responsibility. Even if you try to follow this dogma, in practice classes grow. Some operations are, some more data is added, and sooner or later your class has more than one reponsibility.
> 
> The Extract Class refactoring is best applied if there are logical units of data which are grouped together, or operations which are just performed on a subset of the data.
>
> ### Checklist
> 
> Step 1  
> - Determine what to extract
> - Find logical units of data which are grouped together or operations which are performed on a subset of the data.
>
> Step 2  
> - Create a New Class
> - Create a new class with the extracted operations and establish a link from the old to new class. This link might be bidirectional. 
>
> Step 3  
> - Rename the Old Class
> - If the name of the old class is not fitting anymore, consider renaming it. 
>
> Step 4  
> - Review the interfaces and links of each class
> - The goal should be minimally coupled classes. Examine both classes to see if you can replace a bidirectional relationship with a unidirectional relationship. 
>
> Step 5  
> - Value object vs. reference object
> - Decide whether you would like to expose the new object as a value object (immutable), or a reference object (may be modified).

From here, with examples: <https://scrutinizer-ci.com/docs/refactorings/extract-class>

## S.O.L.I.D. again

- S: SRP
- O: Open/closed
- L: Liskov substitution
- I: Interface segregation
- D: Dependency inversion

<https://en.wikipedia.org/wiki/SOLID>

See [notes from last week](../week-1/oop-concepts.md) too