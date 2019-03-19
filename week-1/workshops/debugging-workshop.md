# Debugging workshop, 7 March 2019
_Coach: Alice_

## Learning objectives

Be able to:

1. Explain what debugging is
2. Describe the _process_ of debugging
3. Apply the process to find bugs in your programs

## 0: What is a bug?

- Something which is causing **incorrect or unexpected results**, or **unintended behaviour**. <https://en.wikipedia.org/wiki/Software_bug>
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

Here's a debugging exercise that we looked at: <https://github.com/makersacademy/skills-workshops/tree/master/week-1/debugging_1>

Work through the exercise applying the method described to improve your debugging skills!

### Method for debugging

Taken from the exercise linked above:

1. Tighten the loop (find the exact line the bug is coming from)
2. Get visibility (use p to inspect everything to help you home in on the exact line)
3. Once you know the one thing that is wrong, out of place, misspelled, or not giving you what you expect, try to fix it.

If you have multiple failing tests Alice recommends to work through them methodically from first to last, because earlier tests are likely to refer to something at the start of your code, which may be having a knock-on effect on the later tests... ultimately it doesn't matter, but "if you're going to start somewhere, the start is not a bad place to start" :)

## 3: Apply the process

### Fixing the first bug in the exercise

Let's go through these 3 steps for the first test failure in the example exercise. I'm going to write the steps down in extremely pedantic detail to illustrate the way step 1 (tighten the loop) and step 2 (get visibility) are iterated in progressively reduce the amount of code you're searching through to find the problem.

#### 1: Tighten the loop

Read `rspec` output carefully to identify the file and the line which is causing the test to fail. Here's the `rspec` output for the first test failure:

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
➜ rspec
."----"
nil
#<Appointment:0x00007fda38aa39c0 @time=2019-03-07 12:03:12 +0000, @title=nil, @location="50 Commercial Street London", @geocoder=Geocoder>
"----"
FF.FF
# more output follows...
```

We can see that the output of `p appointment.title` is `nil`. The next line tells us the same thing - that the `Appointment` object contains an instance variable `@title=nil`.

#### 1 + 2: Continue to iteratate "tightening the loop" and "get visibility" to narrow down where the bug can be

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

We've added `p @title` immediately after `@title` is initialised so we can see what it's initialised to. Run `rspec` again:

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

We've put `p title` immediately after it's first referenced in the method definition. Run `rspec` again:

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

### Fixing the second bug in the exercise

We go through the identical process of tightening the loop and getting visibility until we identify the problem.

Run `rspec`. Here's the output:

```
  1) Appointment#pretty_location pretty-prints the location
     Failure/Error: geocoder.search(location)[0]
     
     NoMethodError:
       undefined method `search' for nil:NilClass
     # /Users/student/.rvm/gems/ruby-2.6.0/gems/really-broken-geocoder-2.0.0/lib/geocoder/query.rb:14:in `execute'
     # /Users/student/.rvm/gems/ruby-2.6.0/gems/really-broken-geocoder-2.0.0/lib/geocoder.rb:22:in `search'
     # ./lib/appointment.rb:22:in `geo_location'
     # ./lib/appointment.rb:15:in `pretty_location'
     # ./spec/appointment_spec.rb:17:in `block (3 levels) in <top (required)>'
```

Alice says that it's good to start at the top of the backtrace and follow the chain forwards:

> In ruby, the top line of the trace will be the exact place the error was thrown. So it makes sense to start there, because the error text will be referring to that line (here, the error was ``undefined method `search` for NilClass:nil``)  
> That line is ambiguous, there are several places in the code where a search method is defined, but by following that exact line, I was able to tell that actually, it wanted a search method on something called 'lookup'

The first line says the program is halting at line 14 in `query.rb`, which is a file in an imported gem. Let's not be scared though, and plunge in...

```ruby
    def execute
      lookup.search(text, options)
    end
```

Line 11 is the one in the middle where the method returns `lookup.search(text, options)`. Let's modify the method like this to see what that line returns:

```ruby
    def execute
      puts "inside execute"
      p lookup.search(text, options)
      puts "---"
      lookup.search(text, options)
    end
```

`rspec` output:

```
➜ rspec
..inside execute
inside lookup
F.FF
// etc...
```

That's weird... the `puts "---"` isn't giving any output... is there a problem with `lookup.search...` which is causing the method to stop executing there? Let's investigate `lookup`. It's a method which is defined elsewhere in the same class:

```ruby
    def lookup
      if !options[:streot_address] and (options[:ip_address] or ip_address?)
        name = options[:ip_lookup] || Configuration.ip_lookup || Geocoder::Lookup.ip_services.first
      else
        name = options[:lookup] || Configuration.lookup || Geocoder::Lookup.street_services.first
      end
      Lookup.get(name)
      return
    end
```

The first thing that jumps to mind is `streot_address` which looks like a spelling of `street_address`, but Alice says not to jump to conclusions - maybe `streot_address` is actually correct! So let's be methodical and keep applying our method.

The second thing that stands out about this is that the `return` keyword with no argument at the end means this method returns `nil`. That doesn't seem right. The `execute` method does `lookup.search`, so it's clearly expecting `lookup` to return an object which responds to the `.search` method, which `nil` will not. In fact the actual error given by `rspec` is ``NoMethodError: undefined method `search' for nil:NilClass``, so maybe we're on the right track.

The penultimate line in the method says `Lookup.get(name)`. This looks like a more likely contender for an object which might respond to `.search`, so maybe that's what the method is supposed to return? Let's get some visibility by modifying `lookup` to dump out `Lookup.get(name)` like this:

```ruby
    def lookup
      if !options[:streot_address] and (options[:ip_address] or ip_address?)
        name = options[:ip_lookup] || Configuration.ip_lookup || Geocoder::Lookup.ip_services.first
      else
        name = options[:lookup] || Configuration.lookup || Geocoder::Lookup.street_services.first
      end
      puts "inside lookup"
      p Lookup.get(name)
      puts "---"
      Lookup.get(name)
      return
    end
```

Run `rspec`:

```
➜ rspec
..inside execute
inside lookup
#<Geocoder::Lookup::Nominatim:0x00007fd5b5906860 @cache=nil>
---
F.FF
// etc...
```

So `Lookup.get(name)` returns... I'm not sure what that is, but a geocoder lookup object or something? That looks like a more likely thing for the method to return than `nil`, so let's remove the final `return` line from the `lookup` method, so that it will return `Lookup.get(name)`.

Do that, run `rspec`, and the test passes. W00tles^2!

### Fixing the third bug in the exercise

I leave this exercise for another day...

## $BONUS: Previous cohort's debugging chat

The previous cohort had a debugging workshop this week as well. They were asked to write down on Post-it notes how they had been learning to debug. Here are some of their notes:

- By doing it
- Read error messages carefully
- Break your code down into small chunks
- Googled it
- Slowly, iteratively
- Practice, reflect, repeat!
