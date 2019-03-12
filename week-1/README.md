# Week 1 notes

## Contents:

- [Week 1 goals](#goals)
- [Coach wisdom](#coach-wisdom)
  - Skills break down into:
    1. Concrete things
    2. Concepts
    3. Processes
    4. Behaviours/mindset
  - More important to learn are **processes** + **behaviours/mindset**, because the first two are usually googleable!
- [Mentor wisdom](#mentor-wisdom)
  - Keep track of feedback from pairing partners as you go along, as it can be useful evidence to include in your portfolio
- [Pairing feedback](#pairing-feedback)

## Week 1 goals <a name="goals"></a>

By the end of the week all developers can:

- [Test-drive a simple program using objects and methods](#test-drive-a-simple-program)
  - Concrete things: Using RSpec
  - Concepts: objects and methods
  - Process: TDD
- [Pair using the driver-navigator style](#pair-using-the-driver-navigator-style)
  - Concrete things: did a whole bunch of pairing
  - Processes: good pairing practices (driver navigator, ping-pong, oneundermanship)
- [Follow an effective debugging practice](#follow-an-effective-debugging-practice)
  - Concrete things: debug some stuff (debugging workshop exercise)
  - Processes: debugging method
- [Describe some basic OO principles like encapsulation, SRP](#basic-oop)
  - Concepts
  - *Alice says we'll be doing a lot of this in Week 2, so less important for Week 1*

### Test drive a simple program

#### Boris Bikes

We test-drove the Boris Bikes project all week. I paired with ["Kim", "Matt Thompson", "James Palmer", "Harry]

**TODO**
- Make a video of me TDD-ing a Codewars Kata like wot Luca did

#### TDD Practical

I went through the TDD practical exercise <https://diode.makersacademy.com/students/Hives/projects/4492>
Here are my notes: <https://github.com/Hives/skills-workshops/blob/master/practicals/test_driving.md>

**TODO:**
- Complete this, and seek feedback from a coach.
- What goals did I achieve from this?

### Pair using the driver navigator style

### Follow an effective debugging practice

#### Debugging workshop and exercise

Alice led a debugging workshop. There was an exercise to go with it where you have to fix three bugs: <https://github.com/Hives/skills-workshops/tree/master/week-1/debugging_1>

(The exercise is on Diode too: <https://diode.makersacademy.com/students/Hives/projects/4531>)

I took notes, including a detailed explanation of using a methodical debugging practice to isolate and fix the first two bugs: [debugging workshop notes](debugging-workshop.md). I asked Alice for feedback on my explanation of fixing the first bug, and she said this:

> I read this yesterday actually, and loved it. I think you described the process well, and can definitely see that you get the debugging process.

### Basic OOP



## Coach wisdom <a name="coach-goals"></a>

Alice said this:

> Good morning @channel!
> 
> This morning, before you start, take some time to reflect on what you have learnt until now.code
> - There may be some new **concrete things** you have done like _write a test_ or _set up rspec_
> - There may be some new **concepts**, like _user stories_, _TDD_, _classes_ and _methods_
> - There may be some **processes** you have followed, like the _debugging process_, _unblocking yourself through research_ or _test-driving_
> - And finally some new **behaviours** or **mindset** that you have picked up on like _keeping my goal in mind when learning_ or _rephrasing some of my thought from "I can't do this" to "I cannot do this yet, but here's how I'll try"_
> 
> 
> At Makers, we believe that the last two, **processes** and **behaviours** are the ones most worth acquiring during your time with us.
> 
> This is because the first two will always be googlable, while the other two are best learnt through a community of practice, feedback, reflection and modelling behaviours of experts. Obviously, they have to be applied to concrete tasks, and the practice of code is indispensable. But practice alone may not create them.
> 
> In order to identify and reinforce processes and behaviours, we encourage **reflection**.
> 
> Each morning, or each night, reflect on what you have learnt, and focus especially on the two latter categories.
> 
> How would you describe you newly aquired processes? What are the steps that you have taken to achieve something.
> 
> How would you describe your mindset? Have things changed in your behaviour as you were pairing or writing code?

This all seems useful, but I wanted to flag up this bit in particular.

> **At Makers, we believe that the last two, _processes_ and _behaviours_ are the ones most worth acquiring during your time with us.**

## Mentor wisdom <a name="mentor-wisdom"></a>

Luca said that his cohort is currently working on their portfolio, which is a document which provides evidence of how you've attained the various skills corresponding to the Makers goals. These are the goals which are listed on Diode: <https://diode.makersacademy.com/students/Hives/goals>

He advised that it's a good idea to be keeping track of this stuff as you go along, by making notes of what goals you're working on week by week and what evidence you've got to say you've achieved them, as it will be much more difficult to extract that evidence from the work we're doing now in eight weeks time!

Here's Luca's portfolio, jam-packed with well-evidenced goodness: <https://github.com/punchcafe/makers_portfolio>

## Pairing feedback <a name="pairing-feedback"></a>

### Matt Thompson (Wed)

Matt said he found that I gave clear explanations of some concepts. For example my explanation of instance variables and `attr_reader` was very helpful in helping him to understand them. He also appreciated my patience when we were going over areas like that that he didn't understand yet.
- Evidence of: good explanations shows understanding of concepts
- Evidence of: patience when pair is coming to understanding = good pairing

I appreciated Matt's pairing technique. We did a relaxed ping-pong method, not strictly alternating after writing every test, but making sure to alternate frequently so that we both remained engaged, at Matt's prompting.
- I learnt: some good pairing practice

### James Palmer (Thurs)

James said he appreciated the ping-pong pairing technique I introduced him to. He said my prompting to swap the keyboard at short intervals as we alternated writing tests and code was effective in keeping both of us engaged, and not zoning out. It also meant we both had practice writing both the code and the tests.
- Evidence of: good pairing

James also said he appreciated that I sometimes went back and wrote further tests for features we had already implemented to reveal deficiencies in our implementation, forcing us improve our code to meet the spec.
- Evidence of: good TDD practice

James pulled us out of a rabbit hole at one point by suggesting we use the exercise's 'walk through' help. We had spent around 20 minutes pursuing a particular path but didn't feel we were making substantial progress. After checking the walk through we realised there was a better approach and got back on track.
- I learnt: unblocking yourself by using available resources

### Harry Galliano (Friday)

> When pairing with you yesterday for the brief two hours that we had to work with I found it to be a very different type of pairing session than the other days of the week, this is because you were so much further ahead of me and i was playing catchup. This was actually very good for me in my eyes (potentially not great for you, as you were going back over things that you had done just a day before) because i really feel i learnt more about TDD and SRP than I had done on any of the other days.
>
> You were a really patient partner which was fantastic as you already seem to know lots about programming and you were very calm the whole way through the afternoon which really helped me to keep going and keep focused. I think the thing you did best was that you would always get me to try my ideas, even when they didn't work, this was great for me being able to visualise exactly why some of my ideas didn't work and you were then kind enough to explain the syntax to me, which was fantastic.