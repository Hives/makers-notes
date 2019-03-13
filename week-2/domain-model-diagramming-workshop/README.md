# Domain model diagramming

[Workshop repo](https://github.com/makersacademy/skills-workshops/tree/master/week-2/domain_model_diagramming)

## Qs before we started

### UML has a lot of models - which are most important?

[Introduction to Unified Modelling Language](https://www.ibm.com/developerworks/rational/library/769.html)

Sophie gave the example of a **use case diagram** -  they may be useful for some people, but she's never been able to understand them. The point being - this stuff is about communicating ideas, so different tools may be appropriate depending on what you're communicating, the domain you're dealing with, and whos doing the communicating.

Today we're looking at [**sequence diagrams**](https://www.ibm.com/developerworks/rational/library/769.html), but this would be too technical to show to a client. For users it might be better to use a [**use case diagram**](https://www.ibm.com/developerworks/rational/library/769.html).

Sophie says [**activity diagrams**](https://www.ibm.com/developerworks/rational/library/769.html) can be useful too.

But the important thing is to choose the right tool for the job.

### What tools are there for diagramming?

- Pen and paper!
- Whiteboard (take photos after if you need)
- Free, powerful online tool: <https://www.draw.io/>. probably better to sketch stuff out on paper/whiteboard before you get to this though.

### How complex should our models be?

Try to keep them as simple as possible while still capturing the important information.

If your diagram is getting too complicated it probably means you need to break your domain up.

## What are we talking about here?

### Sequence diagram

<img src="./img/sequence.png" width=600/>

Thinks about messages which are **sent** by objects. Note that reading from left to right, 'flip' appears before 'Coin', but flip is a method being called *on* 'Coin', *by* 'HeadCount'.

The user is not included in a sequence diagram. It only diagrams the domain's internal behaviour.

### Class diagram

<img src="./img/class.png" width=700 />

Thinks about messages which are **received** by objects.

### Where to start?

At this point someone asked 'which of these would you start with?'
- Good plance to start is the thing that is not included in these diagrams - the user interaction.
- Apart from that, the different diagrams complement each other so you might use both.
- But don't mix up the conventions of the different diagrams - the differnet boxes are specific to different diagram types and it will be confusing if you use the wrong one.

## We did the exercise

[The exercise description in the workshop repo](https://github.com/makersacademy/skills-workshops/tree/master/week-2/domain_model_diagramming#how-do-you-implement-a-program-using-a-domain-modelling-driven-approach)

Here's the diagrams we (me and Alex) came up with:

<img src="./img/our-domain-model-diagrams-1.jpg" width=400 />
<img src="./img/our-domain-model-diagrams-2.jpg" width=400 />

Amy and Evelyn took a different approach - they separated tags out into a `Tag` class of their own. This is useful becuase it allows the system the possibility of managing tags in a helpful way: ("you typed 'shooping', did you mean 'shopping'?). They also made a diagram to show the user interaction before they started on the sequence and class diagrams:

<img src="./img/amy-and-evelyns-diagrams.jpg" width=400 />

Sophie translated the user stories into user interactions:

- create a note
- add a note to a notebook
- add a tag to a note
- search for notes with a particular tag

and then into sequence and class diagrams.

Through diagramming the interaction Sophie came to realise that 'add a tag to note' does not belong on the sequence diagram. The way you'd achieve that is by writing a method on `Notebook` which returns the stored notes. The user can then get the note they want to change from that, and use a method like `set_tag` on the `Note` object. So it's not actually an interaction between `Notebook` and `Note`. So drawing the diagrams helped to clarify the interaction between the classes.

## Sophie's post-workshop notes:

*Key points from the session:*
- Class diagrams capture the messages a class can receive
- Sequence diagrams the messages sent from one class to another, and the value returned
- Messages are verbs, classes are nouns
- The diagrams capture different things - neither by themselves gives a complete picture of the application

*Going further*
- Try turning your diagram into a working application, integrate TDD into this process if you have time.
- Create a diagram of your Boris Bikes, Airport Challenge or Oystercard application