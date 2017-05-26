require_relative 'guessing_game'

describe GuessingGame do
	let(:game) { GuessingGame.new("excited") }

	it "tells player 2 the number of guesses s/he has left" do
		expect(game.guesses_left).to eq 7
		game.correct_guess?('f')
		game.duplicate_guess('f')
		expect(game.guesses_left).to eq 7
		game.duplicate_guess('x')
		game.duplicate_guess('d')
		expect(game.guesses_left).to eq 5
	end
	
	it "checks if the given word includes the character" do
		expect(game.correct_guess?('e')).to eq true
		expect(game.correct_guess?('r')).to eq false
	end

	it "updates the blanks if the guessed character exists" do
		game.correct_guess?('t')
		game.correct_guess?('e')
		expect(game.player2_guesses).to eq "e___te_"
		game.correct_guess?('x')
		game.correct_guess?('c')
		game.correct_guess?('i')
		game.correct_guess?('d')
		expect(game.player2_guesses).to eq "excited"
	end

	it "gives an array of the previous guesses" do
		game.correct_guess?('a')
		game.correct_guess?('i')
		game.correct_guess?('q')
		expect(game.previous_guesses).to eq ["a", "i", "q"]
	end

	it "tests for duplicate guesses" do
		game.correct_guess?('e')
		game.correct_guess?('x')
		game.correct_guess?('c')
		expect(game.duplicate_guess('t')).to eq false
		expect(game.duplicate_guess('x')).to eq true
	end

	it "checks if user has won or not" do
		game.correct_guess?('e')
		game.correct_guess?('x')
		game.correct_guess?('c')
		expect(game.win).to eq false
		game.correct_guess?('i')
		game.correct_guess?('t')
		game.correct_guess?('d')
		expect(game.win).to eq true
	end
end