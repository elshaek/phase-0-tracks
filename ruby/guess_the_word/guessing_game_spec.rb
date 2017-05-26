require_relative 'guessing_game'

describe GuessingGame do
	let(:game) { GuessingGame.new("supercalifragilisticexpialidocious") }

  it "tells player 2 the max number of guesses s/he has" do
    expect(game.guess_limit).to eq 34
  end
	
	it "updates the blanks if given the right character" do
		#game.check_char('l')
		#game.check_char('i')
		expect(game.check_char('a')).to eq true
	end

	# it "gives the current guess count" do
	# 	game.check_char('q')
	# 	game.check_char('e')
  #   expect(game.guess_count).to eq 2
  # end
end