require_relative 'guessing_game'

describe GuessingGame do
	let(:game) { GuessingGame.new("hello") }

  it "tells player 2 the max number of guesses s/he has" do
    expect(game.guess_limit).to eq 5
  end
	
	it "updates the blanks if given the right character" do
		expect(game.check_char('l')).to eq "__ll_"
	end

	it "gives the current guess count" do
		game.check_char('q')
		game.check_char('e')
    expect(game.guess_count).to eq 2
  end
end