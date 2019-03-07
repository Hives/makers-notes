# Week 1 notes

Contents:
- [Week 1 goals](#week-1-goals)
  - [TDD](#test-drive-a-simple-program)
  - [Pairing](#pair-using-the-driver-navigator-style)
  - [Debugging](#follow-an-effective-debugging-practice)
  - [Basic OOP](#basic-oop)
- [Coach wisdom](#coach-wisdom)
- [Mentor wisdom](#mentor-wisdom)
- [Pairing feedback](#pairing-feedback)

## Week 1 goals

By the end of the week all developers can:

- Test-drive a simple program using objects and methods
- Pair using the driver-navigator style
- Follow an effective debugging process
- Describe some basic OO principles like encapsulation, SRP
  - Alice says we'll be doing a lot of this in Week 2, so less important for Week 1

### Test drive a simple program

We test-drove the Boris Bikes project all week. I paired with ["Kim", "Matt Thompson", "James Palmer", pair4]

I went through the TDD practical exercise <https://diode.makersacademy.com/students/Hives/projects/4492>
Here are my notes: <https://github.com/Hives/skills-workshops/blob/master/practicals/test_driving.md>
Complete this, and seek feedback from a coach.

What goals did I achieve from this?

### Pair using the driver navigator style

### Follow an effective debugging practice

Alice led a debugging workshop. I took notes, including a detailed explanation of using a methodical debugging practice to isolate and fix a bug: [debugging workshop notes](debugging-workshop.md)

To do:
- There were three more bugs in the exercise... fix them using the method outlined. Here's the exercise: <https://github.com/Hives/skills-workshops/tree/master/week-1/debugging_1>
- It's on Diode too: <https://diode.makersacademy.com/students/Hives/projects/4531>

### Basic OOP

## Coach wisdom

Alice said this:

>Good morning @channel!
>
>This morning, before you start, take some time to reflect on what you have learnt until now.code
>- There may be some new **concrete things** you have done like _write a test_ or _set up rspec_
>- There may be some new **concepts**, like _user stories_, _TDD_, _classes_ and _methods_
>- There may be some ****processes** you have followed, like the _debugging process_, _unblocking yourself through researc_ or _test-driving_
>- And finally some new **behaviours** or **mindset** that you have picked up on like _keeping my goal in mind when learning_ or _rephrasing some of my thought from "I can't do this" to "I cannot do this yet, but here's how I'll try"_
>
>
>At Makers, we believe that the last two, **processes** and **behaviours** are the ones most worth acquiring during your time with us.
>
>This is because the first two will always be googlable, while the other two are best learnt through a community of practice, feedback, reflection and modelling behaviours of experts. Obviously, they have to be applied to concrete tasks, and the practice of code is indispensable. But practice alone may not create them.
>
>In order to identify and reinforce processes and behaviours, we encourage **reflection**.
>
>Each morning, or each night, reflect on what you have learnt, and focus especially on the two latter categories.
>
>How would you describe you newly aquired processes? What are the steps that you have taken to achieve something.
>
>How would you describe your mindset? Have things changed in your behaviour as you were pairing or writing code?

This all seems useful, but I wanted to flag up this bit in particular.

>**At Makers, we believe that the last two, _processes_ and _behaviours_ are the ones most worth acquiring during your time with us.**

## Mentor wisdom

Luca said that his cohort is currently working on their **portfolio**, which is a document which provides evidence of how you've attained the various skills and aptitudes corresponding to the Makers goals. These are the goals which are listed on Diode: <https://diode.makersacademy.com/students/Hives/goals>

He advised that it's a good idea to be keeping track of this stuff as you go along, by making notes of what goals you're working on week by week and what evidence you've got to say you've achieved them, as it will be much more difficult to pull up that evidence from work we're doing now in eight weeks time!

Here's Luca's portfolio, jam-packed with well-evidenced goodness: <https://github.com/punchcafe/makers_portfolio>

## Pairing feedback

On Wednesday I paired with Matt Thompson. He said he found that I gave clear explanations of some concepts. For example my explanation of instance variables and `attr_reader` was very helpful in helping him to understand them. He also appreciated my patience when we were going over areas like that that he didn't understand yet.
- Good explanations shows understanding of concepts
- Patience when pair is coming to understanding = good pairing

On Thursday I paired with James Palmer. He said he appreciated my pairing technique. We were using a ping pong technique, which he hadn't used before, and he said my prompting to swap the keyboard at short intervals as we alternated writing tests and code was effective in keeping both of us engaged, and not zoning out. It also meant we both had practice writing both the code and the tests.
- Good pairing

James also said he appreciated that I sometimes went back and wrote further tests for features we had already implemented to reveal deficiencies in our implementation, forcing us improve our code to meet the spec.
- Good TDD practice