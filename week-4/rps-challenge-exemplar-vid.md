# Rock Paper Scissors Challenge exemplar video

A video of someone doing the Rock Paper Scissors challenge, the weekend project from week 3: <https://www.youtube.com/watch?v=GoHKmartBYo>

Repo for the code written in the video is here:
<https://github.com/makersacademy/rps-exemplar>

- She did `rspec-sinatra init --app RPS app.rb` at the start - what's that?

  It's this: <https://github.com/tansaku/rspec-sinatra>

  A Gem to initialize an rspec environment for a sinatra application, using capybara.

- I thought the way she wrote this test for the computer's choice was interesting:
  ```ruby
  scenario 'game chooses "Rock"' do
    click_button 'Rock'

    message = find(:css, '#opponent').text

    expect(possible_message).to include message
  end

  def possible_messages
    [:rock, :paper, :scissors].map do |shape|
      "Opponent chose #{shape.to_s.capitalize}!"
    end
  end
  ```

- She started by storing the player name, chosen shape and opponent's chosen shape in the `session` like this:
  ```ruby
  get '/play' do
    @name = session[:name]
    @shape = session[:shape]
    @opponent_shape = session[:opponent_shape]
    erb :play
  end
  ```
  But later she thought this was too much stuff going on in a view, so she replaced the three assignments with one assignment to a `Turn` model, into which she passed the `session`, like this:
  ```ruby
  get '/play' do
    @turn = Turn.new(session)
    erb :play
  end
  ```
  Then she wrote a spec for a simple `Turn` class like this:
  ```ruby
  # spec/turn_spec.rb
  require 'turn'

  describe Turn do
    subject(:turn) { described_class.new(options) }
    let(:options) do
      {
        "player_name" => "Dave",
        "player_shape" => :rock,
        "opponent_shape" => :rock
      }
    end
    
    describe '#player_name' do
      it 'returns player name' do
      expect(turn.player_name).to eq 'Dave'
      end
    end
    
    describe '#player_shape' do
      it 'returns player shape' do
      expect(turn.player_shape).to eq :rock
      end
    end
    
    describe '#opponent_shape' do
      it 'returns opponent shape' do
      expect(turn.opponent_shape).to eq :rock
      end
    end
  end
  ```
  And passed the test with this `turn.rb`:
  ```ruby
  # lib/turn.rb
  class Turn
    attr_reader :player_name, :player_shape, :opponent_shape
  
    def initialize(options)
      @player_name = options["player_name"]
      @player_shape = options["player_shape"]
      @opponent_shape = options["opponent_shape"]
    end
  end
  ```
  So much simpler than what I did :grimacing:

- She used `srand` to ensure the randomised behaviour was predictable in her tests. Seems simple enough - you just do `srand PLAY_SEED` where `PLAY_SEED` is set to some number, and after that all your 'random' behaviour comes out the same every time. See [the docs here](https://ruby-doc.org/core-2.0.0/Random.html#method-c-srand).

  This allowed her to use something like `options.sample` to choose the option. Because I was stubbing out the behaviour of `Kernel.rand` in my tests I had to use random numbers in my model. This method is nicer, as using `options.sample` is a bit more readable.
  
- This was a nice neat API:
  ```ruby
  class Turn
    GAME_RULES = {
        rock: {rock: :draw, paper: :lose, scissors: :win},
        paper: {rock: :win, paper: :draw, scissors: :lose},
        scissors: {rock: :lose, paper: :win, scissors: :draw}
    }
  
    # ....
  
    def win?
        result == :win
    end
    
    def lose?
        result == :lose
    end
    
    def draw?
        result == :draw
    end
    
    private
    
    def result
        return if @opponent_shape.nil?
        GAME_RULES[@player_shape][@opponent_shape]
    end
  end
  