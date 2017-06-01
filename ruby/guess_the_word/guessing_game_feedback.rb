=begin
GUIDE FEEDBACK

When determining attribtue readers and accessors, think about the information you want accessible from 
outside each instance of a class. In the case of this guessing game, being able to read which guesses 
are left for each player, what guesses have been made, and previous guesses are a great use of the 
attr_reader helper method. But being able to read and write the secret word is a lot of power. A player 
could easily ruin the game by reading what the secret word is, or overwrite the word entirely.

When we initialize a class, we set the state of each instance whenever the .new method is called. A 
reasonable state for each game would be the secret word, the number of guesses remaining, perhaps a 
boolean value relating to whether the game is active or not (automatically set to true), and a list 
or previous guesses.

The readability of your code is being compromised by tab spacing. If you are using Sublime as your 
text editor, you can set the tab spacing to 2 spaces per tab strike, and to set the editor to read 
tabs as spaces. This will improve the readability of your code on Github, so there won’t be so much 
whitespace when reading indentations.
- "translate_tabs_to_spaces": false, >>> change to true

Nice job building out the correct_guess? predicate method. The question mark at the end of the method 
name is a convention that identifies this method will return a Boolean, and you’ve organized the logic 
clearly. I would encourage you to work with an #each loop to iterate through the word_array, rather 
than a .length.times method chain. The Ruby way of iterating through a data structure is #each.

There is also a method called #each_with_index that tracks the element and its index. In this way you 
can have the same functionality using a Rubyist approach.

Make sure you name any method that returns either true or false with a question mark. This signals to 
anyone reviewing your code that you’ve built a predicate method, and it will always return either true 
or false.

It’s best to write logic within methods, rather than writing loops and other types of programs in the 
global environment. If you wrap everything in a method and call it with driver code, your file or program 
will be organized in a way that passes information back and forth and keeps the global environment free of 
logic that will run on its own.
=end

# create 2-player game
# 1 user will come up with a word, and another user will guess
	# provided word can be read to update current guesses, and inform players at the end of the game
	# and written (by player 1) 
# number of guesses limited to the length of the word provided
# repeated guesses of the same character count only as 1 guess
# if user guesses the right word, give feedback by updating the blanks with the guessed character filled in


class GuessingGame
	attr_accessor :word
	attr_reader :guesses_left, :player2_guesses, :previous_guesses

	def initialize(guess_word)
		@word = guess_word
		@word_array = @word.chars
		@guesses_left = @word.length
		@player2_guesses = "_" * @word.length
		@previous_guesses = []
	end

	def correct_guess?(char)
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

	def duplicate_guess(user_input)
		if @previous_guesses.include?(user_input)
			true
		else
			@guesses_left -= 1
			false
		end
	end

	def win
		if @player2_guesses.include?("_")
			false
		else
			true
		end
	end
end

# USER INTERFACE
# ask player 1 to provide a word
# then ask player 2 to start guess
# keep asking until there are no more blanks, or until max number of guesses is reached
# give feedback to player after every guess and show how many blanks are left
# if guess is a duplicate, it does not count against the player
# congratulate player if they win, and taunt if s/he loses

puts "This is a 2-player game."
puts "Player 1 - Please type a word for Player 2 to guess:"
word = gets.chomp.downcase
game = GuessingGame.new(word)
system("clear")		# clears the page after Player 1 types the word


puts "Player 2 - you have a maximum of #{game.guesses_left} guesses."

while game.guesses_left > 0
	puts "Make a guess (1 character at a time): #{game.player2_guesses}"
	user_input = gets.chomp
	
	if !game.duplicate_guess(user_input)
		if game.correct_guess?(user_input)
			if !game.win
				puts "Good guess! #{game.player2_guesses}"
				if game.guesses_left == 0
					puts "TOO BAD! You have no more guesses left. The correct word is '#{game.word}'."
				else
					puts "You have #{game.guesses_left} guesses left."
				end
			else
				puts "Great guess! Word: #{game.player2_guesses}"
				puts "Congratulations! You guessed the word!"
				exit
			end
		else
			if game.guesses_left > 0
				puts "Try again. You have #{game.guesses_left} guesses left."
			else
				puts "TOO BAD! You have no more guesses left. The correct word is '#{game.word}'."
			end
		end
	else
		puts "You've previously made that guess, and still have #{game.guesses_left} guesses left."
	end
end
