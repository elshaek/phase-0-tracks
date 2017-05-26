# create 2-player game
# 1 user will come up with a word, and another user will guess
	# provided word can be read to update current guesses, and inform players at the end of the game
	# and written (by player 1) 
# number of guesses limited to the length of the word provided
# repeated guesses of the same character count only as 1 guess
# if user guesses the right word, give feedback by updating the blanks with the guessed character filled in
# congratulate player if they win, and taunt if s/he loses

class GuessingGame
	attr_accessor :word
	attr_reader :guess_limit, :player2_guesses, :previous_guesses

	def initialize(guess_word)
		@word = guess_word
		@word_array = @word.chars
		@guess_limit = @word.length
		@player2_guesses = "_" * @word.length
		@previous_guesses = []
	end

	def check_char(char)
		@previous_guesses << char
		if @word_array.include?(char)
			@word_array.length.times do |x|
				if @word_array[x] == char
					@player2_guesses[x] = char
				end
			end
			true
		else
			false
		end
	end
end

# USER INTERFACE
# ask player 1 to provide a word
# then ask player 2 to start guess
# keep asking until there are no more blanks, or until max number of guesses is reached
# congratulate player if they win, and taunt if s/he loses


puts "This is a 2-player game."
puts "Player 1 - Please type a word for Player 2 to guess:"
word = gets.chomp.downcase
game = GuessingGame.new(word)
system("clear")		# clears the page after Player 1 types the word


puts "Player 2 - you have a maximum of #{game.guess_limit} guesses."
guesses_left = game.guess_limit

while guesses_left > 0
	puts "Make a guess (1 character at a time): #{game.player2_guesses}"
	user_input = gets.chomp
	
	if !game.previous_guesses.include?(user_input)
		guesses_left -= 1

		if game.check_char(user_input)
			if game.player2_guesses.include?("_")
				puts "Good guess! #{game.player2_guesses}"
				if guesses_left == 0
					puts "TOO BAD! You have no more guesses left. The correct word is '#{game.word}'."
				else
					puts "You have #{guesses_left} guesses left."
				end
			else
				puts "Word: #{game.player2_guesses}"
				puts "Congratulations! You guessed the word!"
				exit
			end
		else
			if guesses_left > 0
				puts "Try again. You have #{guesses_left} guesses left."
			else
				puts "TOO BAD! You have no more guesses left. The correct word is '#{game.word}'."
			end
		end
	else
		puts "You've previously made that guess, and still have #{guesses_left} guesses left."
	end
end