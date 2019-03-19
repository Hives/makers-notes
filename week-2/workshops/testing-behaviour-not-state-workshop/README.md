# Testing behaviour not state, and why should you care?
*Date: Fri 15 Mar*  
*Coach: none (did it on my own)*  

Read through the [workshop details](https://github.com/hives/skills-workshops/blob/master/practicals/testing/behaviour_not_state.md) for examples of good and bad practice.

### How does testing state happen?

This is more or less how it happens:

1. You're halfway through solving a problem and you realise you need to test
2. So you take what you've just made and write a test for what your method does
3. You fiddle with your class so it exposes the effect your method has on the object's state.
4. Hey presto — you're testing the state.

### Why is this bad?

You care because now your class exposes its implementation (how it does its job) and your tests are relying on it too.

That means that if you want to refactor Diary, **extract a class from it**, or change the way it stores its state — you have to change your tests.

### How do I test behaviour?

Follow this process:

1. Who or what is the user of this code? It might be the end user (a real person), or it might be another class
2. What job is this code doing for that user?

For example:

> Question: Who, or what, is the user of this code? Answer: The user of my Diary class is a person who is keeping their diary
>
> Question: What job is this code doing for that user? Answer: They add an entry so they can read it later

That second answer is the job or behaviour of the Diary class, so that's what you should test.

### Why is this good?

1. We can TDD this without having to think much about how we will implement it (hashes, arrays, etc)
2. We can refactor our class internals without this test failing
3. We're testing that the class does its job, not how it does it. Encapsulation!

## Exercise 1 - tic-tac-toe

