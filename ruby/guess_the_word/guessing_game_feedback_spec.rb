require_relative 'guessing_game_feedback'

describe GuessingGame do
  let(:game) {GuessingGame.new("hello")}

  it "checks if the character had been guessed previously" do
    expect(game.char_previously_guessed?("p")).to eq false
    expect(game.char_previously_guessed?("p")).to eq true
  end

  it "lets user know if they made the right guess" do
    expect(game.check_guess("t")).to eq "Try again."
    expect(game.check_guess("e")).to eq "Good guess!"
  end

  it "checks if the game was won within the given number of guesses" do
    game.check_guess("h")
    game.check_guess("e")
    game.check_guess("l")
    game.result
    expect(game.is_over).to eq false
    game.check_guess("o")
    game.result
    expect(game.is_over).to eq true
  end

  it "checks when the game was NOT won within the given number of guesses" do
    game.check_guess("h")
    game.check_guess("e")
    game.check_guess("p")
    game.check_guess("r")
    game.check_guess("o")
    game.result
    expect(game.is_over).to eq false
  end

  it "checks if the blanks are being updated after a good guess" do
    game.check_guess("h")
    game.check_guess("l")
    expect(game.blanks).to eq "h_ll_"
  end
end