# Week 6 notes

Contents:

- [Week 6 goals](#goals)
- [Challenges](#challenges)

## <a name='goals'>Week 6 goals</a>

### Kick-off

It's about teamwork, agile practices etc...

Project is **[Makers B'n'B](https://github.com/makersacademy/course/tree/master/makersbnb)**

#### High level skills

To guide your learning, aim to be able to answer "yes" to the questions below. Return to these questions each day to guide your learning.

- Can you use the [**XP values**](http://www.extremeprogramming.org/values.html) to guide your behaviour?
    - Communication.
    - Simplicity.
    - Feedback.
    - Courage.
    - Respect.

- Can you follow the full [**developer workflow**](https://github.com/makersacademy/course/blob/master/pills/development_workflow.md)? (Creating issues, branching, reviewing, squirrelling, merging.)
    - Create an issue on GitHub
    - Create a branch for it
    - Pair on implementing the user story
    - Create a pull request
    - Get another team member to do a code review on it
    - Discuss and make improvements on code until you and reviewer are satisfied
    - Merge
    - Do some QA on live site
    - Highfive

- Can you keep code quality and test coverage high whilst building new features?
    - Should install Travis CI

#### Processes

By the end of the week all developers can build tested, easy-to-change software in a team using these processes:

- Break down projects into tasks and allocate them to pairs
- Build to a specificiation (rather than challenges)
    - Go back and check work against spec and mockups
- Run stand-ups and retrospectives
- Use a branch/PR/merge git workflow
- Give and receive meaningful code review


## <a name='challenges'>Challenges</a>

It's all about Makers Bnb.
- [Makers repo](https://github.com/makersacademy/course/tree/master/makersbnb   )
- [Our repo](https://github.com/andrewmclelland23/makers-bnb)

### Notes, Wednesday morning

- [Scrum diagram off Wikipedia][scrum]
- We've completed our MVP sprint, need to plan our next one. What's our next goal?
- Should we do a sprint retrospective?
- Get user flows working right - check against mockups, make sure all pages are accessible via navigation
- Code quality review? (should be doing these regularly)
- Travis CI
- Do I need to document/communicate what I've done on the html and css so other team members can create similar templates?

[scrum]: https://en.wikipedia.org/wiki/Scrum_(software_development)#/media/File:Scrum_Framework.png

### Reflectionz

- Best thing we did was when we were working on filtering booked dates out of the range of dates presented in the datepicker. My team was working on the Ruby back end which spat the dates out into a `data-` attribute in the date form, and the other team was working on the front end which would pull the dates into the datepicker UI. We agreed the format of how this would would work in advace, and both worked on it at the same time. When we both merged our branches it worked. Felt good man
- Not so good - no code reviews, code quality was getting pretty shonky I think...
- Kanban updating fell by the wayside a bit
- MVP 2-day sprint went very well. Achieved everything we wanted. Good communication at beginnig middle and end of day to make sure we were all working well together.

Technical stuff
- Had a git nightmare this morning - ended up having to write my email code three times because I kept losing it?!?!?
- Dependency injection in Sinatra - [here's what I came up with](https://github.com/makers-bnb/makers-bnb/commit/00bd9f1b235700b67c390123a69e4691525826c5). Must be a better way?