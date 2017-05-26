=begin
Using plain old English in a text file or other scratch pad, pseudocode a class for a 
word-guessing game that meets the following specifications. Assume your driver code will 
handle input and output as far as the user is concerned. In other words, write a class 
designed for a computer program to use, not one designed for a human to use directly, 
then use driver code to bridge the gap between human and Ruby object.

- One user can enter a word (or phrase, if you would like your game to support that), and 
another user attempts to guess the word.
- Guesses are limited, and the number of guesses available is related to the length of the word.
- Repeated guesses do not count against the user.
- The guessing player receives continual feedback on the current state of the word. So if the 
secret word is "unicorn", the user will start out seeing something like "_ _ _ _ _ _ _", 
which would become "_ _ _ c _ _ _" after the user enters a guess of "c".
- The user should get a congratulatory message if they win, and a taunting message if they lose.

# PESUDOCODE
# create 2-player game
# 1 user will come up with a word, and another user will guess
	# provided word can be read to update current guesses, and inform players at the end of the game
	# and written (by player 1) 
# number of guesses limited to the length of the word provided
# repeated guesses of the same character count only as 1 guess
# if user guesses the right word, give feedback by updating the blanks with the guessed character filled in
# congratulate player if they win, and taunt if s/he loses

=end

class GuessingGame
	attr_accessor :word
	attr_reader :guess_count, :guess_limit

	def initialize(guess_word)
		@word = guess_word.downcase
		@word_array = @word.chars
		@guess_limit = @word.length
		@guess_count = 0
		@blanks = "_" * @word.length
	end

	def check_char(char)
		@guess_count += 1
		if @word_array.include?(char)
			@word_array.length.times do |x|
				if @word_array[x] == char
					@blanks[x] = char
				end
			end
		end
		@blanks
	end
end

#game = GuessingGame.new("hello")
#p game.check_char('l')