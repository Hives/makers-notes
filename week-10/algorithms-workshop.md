# Alogrithm design workshop

*Tue 7 May, Week 10*  
*Coach: Alice*  
*[Workshop repo](https://github.com/makersacademy/skills-workshops/tree/master/week-10-apprs/writing-algorithms)*

### What is an algorithm?

- Sequence of steps to get from an input to an output
- It doesn't have to be code (e.g. a cake recipe)

If I give you input/output, how do you get to the algorithm? 
- Break it down into human readable steps

### Problem - dividing up a group

Split a cohort into N equally size groups. E.g. March cohort has 22 people, let's divide into 4 groups.

1. Divide 22 by 4 and round down. We have 4 groups of 5 with 2 left over. Distribute the remainder between two of the groups.
2. "Dealing cards" method. 4 groups, distribute members 1 into each group sequentially.

#### Approach

1. Describe problem - what's your input and output?
    - Input for our example is an array of strings of student names, and an integer value of N.
    - Output will be an array of N arrays containing the names of the members of each group.
    - This will inform the [signature](https://developer.mozilla.org/en-US/docs/Glossary/Signature/Function) of your function
2. Create test cases. Not talking about e.g. RSpec tests here, just something like a table with input and output
   - e.g. ["a", "k", "s"], -2 -> not specified, or error
   - e.g. ["a"], 3 -> [["a"], [], []]
   - e.g. ["a", "k"], 2 -> (normal)
   - e.g. ["a", "k", "s"], 2 -> (normal)
   - e.g. ["a"], 0 -> not specified, or error (edge case)
   - e.g. [], 0 -> ??
   - e.g. [], 2 -> ??  
You may have to make a decision on how to deal with edge/error cases.
3. Think about how you would do with this with real objects, cards/paper/books
4. Write down each step
5. Translate each step to code one by one
6. Run test cases (hopefully you would have done this already)
7. Fail? paper debug

### Example - return duplicates (sat on the sofa with David Thai)

Take an array of integers and return an array containing all the duplicates.
e.g.
- Input: [0, 1, 0, 3, 7, 4, 3, 3]
- Output: [0, 3]

1. Describe problem (method signature?)
    - Input: Array
    - Output: Array

2. Test cases
    - [0, 1] -> []
    - [0, 0, 1] -> [0]
    - [0, 1, 0] -> [0]
    - [0, 0, 0, 1] -> [0]
    - [0, 1, 0, 1] -> [0, 1]
    - [1, 1, 0, 0] -> [0, 1]
    - [0, 0, 'one', 'one'] -> [0, 'one']

3/4. How would you do it with real objects? E.g. doing it with a deck of cards scattered on the floor:

    1. Pick them up  
    2. Put one down on the table  
    3. Is the next one the same as one that's already on the table? If yes add it to that pile, if no start a new pile  
    4. Repeat 3 until all cards disposed of  
    5. Remove all cards in piles of 1  
    6. Remove all but 1 card from remaining piles  

5. Write some code:  
```ruby
def duplicates(input)
  temp = []
  output = []
  input.each do |n|
    if temp.include?(n)
      unless output.include?(n)
        output.push(n)
      end
    else
      temp.push(n)
    end
  end
  output
end
```

### Conclusion

For simple problems this might be a bit over the top - could be quicker to just start writing code. But this process is very useful for bigger, more complex problems.