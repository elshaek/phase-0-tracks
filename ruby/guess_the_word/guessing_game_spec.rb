require_relative 'guessing_game'

describe GuessingGame do
	let(:game) { GuessingGame.new("supercalifragilisticexpialidocious") }

	it "tells player 2 the max number of guesses s/he has" do
		expect(game.guess_limit).to eq 34
	end
	
	it "checks if the given word includes the character" do
		expect(game.check_char('a')).to eq true
	end

	it "updates the blanks if the guessed character exists" do
		game.check_char('a')
		game.check_char('i')
		game.check_char('u')
		expect(game.player2_guesses).to eq "_u____a_i__a_i_i__i____ia_i___i_u_"
	end

	it "gives an array of the previous guesses" do
		game.check_char('a')
		game.check_char('i')
		game.check_char('q')
		expect(game.previous_guesses).to eq ["a", "i", "q"]
	end
end