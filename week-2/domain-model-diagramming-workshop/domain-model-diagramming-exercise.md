# Domain model diagramming

## Learning objectives

1. Describe a domain model as the nouns and verbs in a program, and the relationships between them.
2. Explain how you use domain model diagramming in your development process.
3. Use domain model diagramming to help you write better code.

## User stories

```
As a person
So I can have fun
I want to be able to flip a coin and find out if it came up heads or tails
```

```
As a person
So I can keep score
I want to be able to find out how many times the coin comes up heads
```

```
As a person
So I can remember my best score
I want to be able to print out my score
```

## A domain model diagram

* The programmer diagrams a domain model for these user stories:

```
+-----------+         +--------+
| HeadCount +--flip-->+  Coin  |
+-----------+         +--------+
```

* They look at it and realise it's not very good.  Where does the score printing logic go? Is it really the responsibility of HeadCount to flip the coin?

* But they've already saved time because they didn't have to write code to discover these problems.

* They start trying to fix the problems in their domain model.  They do this by changing their diagram, rather than writing code.  This saves them even more time.

## How do you diagram a domain model?

Domain models can be expressed in many forms.  

* Nouns and verbs using boxes and arrows. (As above.)

* Nouns and verbs in lists. (As you did at the beginning of week 1.)

The Unified Modelling Language (UML) is a widely adopted standard for  creating a variety of diagrams which can be useful in your work as a developer:

* A sequence diagram:

A sequence diagram represented the flow of information throughout your domain.  A sequence diagram for our coin flipping application might look like this:  

<img src="./img/sequence.png" width="600" height="350" />

The objects in your model are represented by the boxes at the top of the diagram.  The solid arrows pointing to the right represent the messages being sent between your objects and are labelled with their names.  The dashed arrows pointing left represent the return values, and are labelled with their types.

* A class diagram:

A class diagram represents the relationships between objects in your model.  A class diagram for an application for logging the results of a series of dice rolls might look like this:

<img src="./img/class.png" width="600" height="200" />

The objects in your model are represented by boxes subdivided into up to three sections.  The name of the object is placed in the top section, any instance variables go in the middle, and methods are listed in the bottom section.  The arrows between the boxes indicate that the class at the base of the arrow knows about the class at the tip.

UML covers 13 different diagram types, each tailored to particular situations.  Different forms work for different cases.  Experiment!

## How do you implement a program using a domain modelling-driven approach?

1. Diagram a domain model that will satisfy the user stories.
2. Write code to implement the domain model.
3. If the domain model is hard to implement, or you're writing bad code, return to step 1.

## Instructions (50 minutes)

* Spend 25 minutes implementing the coin flipping program using the domain modelling-driven approach.

* Don't write tests.  In this workshop, we want to focus on the domain model diagramming.

* After the 25 minutes is up, spend another 25 minutes implementing the notebook user stories using the same domain modelling-driven approach.

### Notebook

```
As an office worker
So I can record useful information
I want to be able to create a text note
```

```
As an office worker
So I can carry all my useful information
I want to keep all my notes in a notebook.
```

```
As an office worker
So I can categorise a note
I want to be able to add a tag (only one tag) to a note
```

```
As an office worker
So I can find notes on a certain topic
I want to be able to search for all the notes with a specific tag
```

## Plenary (15 minutes)

At the end, we'll gather to show our diagrams and discuss our diagramming strategies.

## Resources
[An introduction to UML](https://www.ibm.com/developerworks/rational/library/769.html)
