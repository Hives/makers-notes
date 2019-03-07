# Debugging workshop, 7 March 2019
_Coach: Alice_

## Learning objectives

Be able to:

1. Explain what debugging is
2. Describe the _process_ of debugging
3. Apply the process to find bugs in your programs

## 0: What is a bug?

- Something which is causing unintended behaviour or results, or an error <https://en.wikipedia.org/wiki/Debugging>
- There was some debate over whether performance issues could be bugs - in general probably not. Your website might be running slowly, but it still works. But in some cases poor performance may be caused by a bug.

### Errors

Here are some examples of possible errors:
- **Syntax error** - computer cannot parse your code. Easiest type of error to identify and fix because it will return an error and a stack trace.
- **Memory errors** - could be an environment problem, i.e. not a bug, or could be that your code is handling memory wastefully, which would be a bug
- **Name error** - undefined variable, method, class... common error!
- **Logic error**, i.e. 'Wrong behaviour' - can be hard to debug because you won't get an error message/stack trace. Often these come up when the user does something you didn't anticipate. Might start by writing new tests to address this use case.

## 1: What is debugging?

- Removing bugs (duh :) )
- Identifying the cause of the problem

## 2: Debugging process

Heres a debugging exercise that we looked at: <https://github.com/makersacademy/skills-workshops/tree/master/week-1/debugging_1>

### Method for debugging

Taken from the exercise above:

1. Tighten the loop (find the exact line the bug is coming from)
2. Get visibility (use p to inspect everything to help you home in on the exact line)
3. Once you know the one thing that is wrong, out of place, misspelled, or not giving you what you expect, try to fix it.

If you have multiple failing tests Alice recommends to work through them methodically from first to last, because it's likely to be something at the start of your code... ultimately it doesn't matter, but "if you're going to start somewhere, the start is not a bad place to start" :)

## 3: Apply the process

Let's go through these 3 steps for the first test failure in the example exercise. I'm going to write the steps down in extremely pedantic detail to illustrate the way step 1 (tighten the loop) and step 2 (get visibility) are iterated in progressively reduce the amount of code you're searching through to find the problem.

#### 1: Tighten the loop

Read RSpec output carefully to identify the file and the line which is causing the test to fail. Here's the RSpec output for the first test failure:

```ruby
  1) Appointment#title has a title
     Failure/Error: expect(appointment.title).to eq "Test appointment"

       expected: "Test appointment"
            got: nil

       (compared using ==)
     # ./spec/appointment_spec.rb:9:in `block (3 levels) in <top (required)>'
```

So we can see the error came in `spec/appointment_spec.rb` on line 9. The test expected `appointment.title` to equal `"Test appointment"`, but it returned `nil`.

Let's have a look at line 9 in `appointment_spec.rb`:

```ruby
      expect(appointment.title).to eq "Test appointment"
```

#### 2: Get visibility

Now that we've located the line in the test spec which is failing, let's add some code to print out everything we think might be relevant to the problem. We'll want `appointment.title` since that's what's got the wrong value, but let's get `appointment` too. So we'll add to the relevant `describe` block in `spec/appointment_spec.rb` to look like this:

```ruby
  describe '#title' do
    it 'has a title' do
      p "----"
      p appointment.title
      p appointment
      p "----"
      expect(appointment.title).to eq "Test appointment"
    end
  end
```

The `p "----"` lines are just to mark off our debugging output from the rest of the output.

Running `rspec` again shows us this at the top of the output:

```ruby
➜➜ rspec
."----"
nil
#<Appointment:0x00007fda38aa39c0 @time=2019-03-07 12:03:12 +0000, @title=nil, @location="50 Commercial Street London", @geocoder=Geocoder>
"----"
FF.FF
# more output follows...
```

We can see that the output of `p appointment.title` is `nil`. The next line tells us the same thing - that the `Appointment` object contains an instance variable `@title=nil`.

#### 1 + 2: Repeatedly iteratate "tightening the loop" and "get visibility" to narrow down where the bug can be

Let's look at the `appointment_spec.rb` again to see what happens up to the point where the test fails. These lines at the start of the spec...

```ruby
describe Appointment do
  subject(:appointment) { described_class.new(time, "Test appointment", "50 Commercial Street London") }
  let(:time) { Time.now }
  # ...
```

...tell us that `appointment` is initialised using the command `described_class.new(time, "Test appointment", "50 Commercial Street London")`. The third line tells us that the variable `time` is set to `Time.now`, and the first line tells us that `described_class` refers to the class `Appointment`.

We can see from the spec that nothing else happens to `appointment` between being initialised and our test running, so it seems likely that something is going wrong with the initialisation.

Let's find out how this object is initialised. The top line of the spec says `require 'appointment'`, so my knowledge of RSpec tells me that this will import `lib/appointment.rb`. So let's look in that file and find the initialisation method for the `Appointment` class. Here are lines 7 to 12 of that file.

```ruby
  def initialize(time, tit1e, location, geocoder = Geocoder)
    @time = time
    @title = title
    @location = location
    @geocoder = geocoder
  end
```

Let's modify this method to dump some debugging information:

```ruby
  def initialize(time, tit1e, location, geocoder = Geocoder)
    p "Inside the initialiser"
    @time = time
    @title = title
    @location = location
    @geocoder = geocoder
  end
```

This will allow us to be sure that the `initialize` method is running. Running `rspec` again gives this output:

```ruby
➜ rspec
"Inside the initialiser"
."----"
"Inside the initialiser"
nil
#<Appointment:0x00007faef7223b68 @time=2019-03-07 12:10:00 +0000, @title=nil, @location="50 Commercial Street London", @geocoder=Geocoder>
"----"
F"Inside the initialiser"
F.FF
# more output follows...
```

So yes, `initialize` runs a bunch of times as the tests run.
Let's modify `initialize` again:

```ruby
  def initialize(time, tit1e, location, geocoder = Geocoder)
    p "Inside the initialiser"
    @time = time
    @title = title
    p @title
    @location = location
    @geocoder = geocoder
  end
```

And run `rspec` again:

```ruby
➜ rspec
"Inside the initialiser"
nil
."----"
"Inside the initialiser"
nil
nil
#<Appointment:0x00007fcea42d3c08 @time=2019-03-07 12:13:28 +0000, @title=nil, @location="50 Commercial Street London", @geocoder=Geocoder>
"----"
F"Inside the initialiser"
nil
F.FF
# more output follows...
```

So `@title` is getting initialised to `nil`. That's not right. It's supposed to get set to the value of `title`, which is supposed to be set to the argument passed to `initialize`, which is `"Test appointment"`. Let's modify `initialize` again to show us the value of `title`:

```ruby
  def initialize(time, tit1e, location, geocoder = Geocoder)
    p title
    p "Inside the initialiser"
    @time = time
    @title = title
    p @title
    @location = location
    @geocoder = geocoder
  end
```

Run `rspec` again:

```ruby
➜ rspec
nil
"Inside the initialiser"
nil
."----"
nil
"Inside the initialiser"
nil
nil
#<Appointment:0x00007fddc9a867c8 @time=2019-03-07 12:19:15 +0000, @title=nil, @location="50 Commercial Street London", @geocoder=Geocoder>
"----"
Fnil
"Inside the initialiser"
nil
F.FF
# more output follows...
```

So the value of `title` is `nil`. It's not getting passed the parameter value properly. Becuase our `p title` line is the first line in the method block, we know that the problem must be in the single line of the method which comes before that, which is:

```ruby
  def initialize(time, tit1e, location, geocoder = Geocoder)
```

So looking at this very carefully we can see there's a typo: instead of `title`, the parameter is called `tit1e`.

#### 3: Fix the error

So let's correct that `tit1e` to `title` and re-run the tests. `rspec` now reports that the test is passing. W00t!

## $BONUS: Previous cohort's debugging chat

The previous cohort had a debugging workshop this week as well. They were asked to write down on Post-it notes how they had been learning to debug. Here are some of their notes:

- By doing it
- Read error messages carefully
- Break your code down into small chunks
- Googled it
- Slowly, iteratively
- Practice, reflect, repeat!