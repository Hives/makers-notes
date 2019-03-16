# Airport challenge exemplar video

A video of someone (lol 'someone' - Sam Morgan, the Head of Education at Makers) doing the airport challenge, the weekend project from week 1: <https://www.youtube.com/watch?v=Vg0cFVLH_EM>

Repo for the code written in the video is here:
<https://github.com/sjmog/airport_challenge_exemplar>

- Feature/unit test driven proces:
  1. He started by converting user stories into feature tests one by one, in `spec/features/user_stories_spec.rb`
  2. When the feature test failed he wrote a unit test for the class, looking to produce the same error as the feature test
  3. Only then did he write the code to satisfy both tests.
- Doing it like this means you work through each successive error that the feature test throws up, writing a unit test for each one, until the feature test is implemented. The same goes for if you do something later on that breaks earlier tests - update your unit tests to produce the same error as the feature test, and then write the code to pass only that exact error.
- In his unit tests he used the one liner syntax to check that `subject` was responding to a particular method before writing a test for the behaviour of that method ([but he also said he didn't like the one liner syntax, and you should only use it as scaffolding?!](https://www.youtube.com/watch?v=Vg0cFVLH_EM&t=9m26s)):
  ```ruby
  describe Airport do
    describe '#land' do
      it { is_expected.to respond_to :land }

      it 'does something' do
        expect(subject.land).to do_something
      end
    end
  end
  ```
- Better to use an explicit `subject` in your tests for readability, e.g:
  ```ruby
  describe Airport do
    subject(:airport) { described_class.new(20) }

    it 'does something' do
      expect(airport).to do_something

  # etc...
  ```
  You can also create new `subject`s inside your `context`s with more readable names, e.g.
  ```ruby
  context 'default behaviour' do
    subject(:default_airport) { described_class.new }

    it 'has some default behaviour' do
      expect(default_airport).to do_something_default

  # etc...
  ```
- Good to use `context` blocks to structure your test output/documentation, but maybe leave that to the refactor phase
- You can stub out random behaviour at a low level by using e.g. 
  ```ruby
  Kernel.rand(1..10)
  ```
  instead of just:
  ```ruby
  rand(1..10)
  ```
  Then you can stub it out like:
  ```ruby
  allow(Kernel).to receive(:rand).and_return(1)
  ```
  He didn't seem to think it necessary to stub this out at such a low level at first, when the weather was being handled inside `Airport`, but when he extracted that out into a `WeatherReporter` class he used this technique to interrogate it in more detail, since that was the only thing that class was doing. 
- Public methods should be super nice and readable. For private methods readability is not so important. So it may be preferable to refactor elements of public methods into private methods for improved readability. e.g.
  ```ruby
  def land(plane)
    raise 'Cannot land plane: airport full' if @planes.length >= @capacity
    # stuff...
  end
  ```
  could be refactored to this:
  ```ruby
  def land(plane)
    raise 'Cannot land plane: airport full' if full?
    # stuff...
  end

  private

  def full?
    @planes.length >= @capacity
  end
  ```
  Likewise, he refactored `planes << plane` into an `add_plane(plane)` private method, and `planes.pop` into a `remove_plane(plane)` private method.
- `xit` - used in place of `it` to define pending tests, e.g. things that you're going to come back and implement later
- He preferred to refactor out instance variables where possible with `attr_readers`. e.g.  since he had previous set an `attr_reader` on `@planes`, he could refer to `@planes` internally as just `planes`. Where he didn't want to make an instance variable publically accessible he set a `private` `attr_reader`, so again he could get rid of a lot of the `@`s.  
He also considered using `private` `attr_writer` and `attr_accessor` if the instance variable was getting written inside the object.
- In `Plane` he didn't like that he had a condition `unless flying` - he thought it would read better the other way around, so he refactored it like this:
  ```ruby
  def my_method
    raise some_error if landed
    # stuff...
  end

  private

  def landed
    !flying
  end
  ```
  So again this is making the public methods super readable by moving the more complex bits into private methods.
