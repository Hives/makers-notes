# RSpec and general TDD stuff too

## Better specs (Rspec guidelines)

<http://www.betterspecs.org/#all>

Lots of best practice principles for RSpec. Warning - sometimes references RSpec 2.

## RSpec `subject`

<https://relishapp.com/rspec/rspec-core/v/3-8/docs/subject>

Implicit subject:
> If the first argument to the outermost example group is a class, an instance of that class is exposed to each example via the subject method.
> ```ruby
> RSpec.describe Array do
>   it "should be empty when first created" do
>     expect(subject).to be_empty
>   end
> end
> ```

Explicit subject:
> Use subject in the group scope to explicitly define the value that is returned by the subject method in the example scope.
> ```ruby
> RSpec.describe Array, "with some elements" do
>   subject { [1, 2, 3] }
> 
>   it "has the prescribed elements" do
>     expect(subject).to eq([1, 2, 3])
>   end
> end
> ```

One-liner syntax:
> RSpec supports a one-liner syntax for setting an expectation on the subject. RSpec will give the examples a doc string that is auto-generated from the matcher used in the example.
> ```ruby
> RSpec.describe Array do
>   describe "when first created" do
>     # Rather than:
>     # it "should be empty" do
>     #   subject.should be_empty
>     # end
> 
>     it { should be_empty }
>     # or
>     it { is_expected.to be_empty }
>   end
> end
> ```
> Outputs:
> ```
> Array
>   when first created
>     should be empty
>     should be empty
> ```

## RSpec - prefer `let` to `before` block

<http://www.betterspecs.org/#let>

Among other reasons, preferable because `let` lazyloads, whereas if you initialize variables in a `before` block then they get initialized immediately, even if a test doesn't use them. So this is bad:

```ruby
describe '#type_id' do
  before { @resource = FactoryGirl.create :device }
  before { @type     = Type.find @resource.type_id }

  it 'sets the type_id field' do
    expect(@resource.type_id).to equal(@type.id)
  end
end
```

And this is better:

```ruby
describe '#type_id' do
  let(:resource) { FactoryGirl.create :device }
  let(:type)     { Type.find resource.type_id }

  it 'sets the type_id field' do
    expect(resource.type_id).to equal(type.id)
  end
end
```

Good StackOverflow explanation of this [here](https://stackoverflow.com/questions/5359558/when-to-use-rspec-let/5359979#5359979).

## Mocking

Lotta info here: <https://github.com/rspec/rspec-mocks>

#### Doubles

Instead of testing ObjectA against an instance of ObjectB, I use a stand in (a stuntman if you like) for ObjectB instead. ObjectA doesn't know the difference, it simply treats the double as if were an instance of ObjectB, but it's not - it's a dummy that I've set up with static (and therefore not variable) values.

#### Stubs

I want to test some behaviour of ObjectA, but during the execution of that behaviour, ObjectA calls a method on ObjectB. I don't need to test that the method on ObjectB gets called, but I do want to make sure that when it does, the method on ObjectB always returns a specific value.

#### Mocks

I want to test some behaviour of ObjectA and, critically, during the execution of that behaviour, ObjectA must call a method on ObjectB with specific arguments. In my test, I don't particularly care what happens afterwards, but I want to test that in the code that is about to be executed the specific method is called with the correct arguments.

#### Spies

I want to test some behaviour of ObjectA and, critially, during the execution of that behaviour, ObjectA must call a method on ObjectB with specific arguments (sound familiar?). In my test, I don't particularly care what else happened during the test, just that in the code that was just executed the specific method was called with the correct arguments.
