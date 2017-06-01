=begin
GUIDE FEEDBACK

When determining attribtue readers and accessors, think about the information you want accessible from 
outside each instance of a class. In the case of this guessing game, being able to read which guesses 
are left for each player, what guesses have been made, and previous guesses are a great use of the 
attr_reader helper method. But being able to read and write the secret word is a lot of power. A player 
could easily ruin the game by reading what the secret word is, or overwrite the word entirely.
- change :word from attr_accessor to attr_reader

When we initialize a class, we set the state of each instance whenever the .new method is called. A 
reasonable state for each game would be the secret word, the number of guesses remaining, perhaps a 
boolean value relating to whether the game is active or not (automatically set to true), and a list 
or previous guesses.
- DELETE @word_array, @player2_guesses from initialize
- ADD @game_over? 

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
  attr_reader :secret_word, :guesses_left, :previous_guesses, :blanks, :is_over

  def initialize(secret_word)
    @secret_word = secret_word
    @guesses_left = @secret_word.length
    @previous_guesses = []
    @blanks = "_" * @secret_word.length
    @is_over = false
  end

  # check if character had been guessed before
  # IF yes, number of guesses left does not change, and let user know
  # IF not, add character to list of previous guesses, and decrease guesses left by 1
  def char_previously_guessed?(char)
    if @previous_guesses.include?(char)
      puts "You've previously made that guess."
      puts "\n"
      true
    else
      @guesses_left -= 1
      @previous_guesses << char
      false
    end
  end

  # check if the character guessed is included in the secret word
  # IF yes, update the blanks with the character
  # IF not, ask player to try again
  def check_guess(char)
    @secret_word_array = @secret_word.chars
    @outcome = ""

    if @secret_word_array.include?(char)
      @secret_word_array.each_index do |index|
        if @secret_word_array[index] == char
          @blanks[index] = char
        end
      end
      @outcome = "Good guess!"
    elsif !@secret_word_array.include?(char) && @guesses_left > 0
      @outcome = "Try again."
    end
    @outcome
  end

  # check if the user had guessed the word
  # IF there are are no more guesses left and there are still blanks, taunt player
  # IF word was guessed, congratulate player
  def result
  	@message = ""
    if @blanks == @secret_word
      @message = "CONGRATULATIONS! You guessed the word!\nWord: #{@secret_word}"
      @is_over = true
    elsif @blanks != @secret_word && @guesses_left == 0
      @message = "TOO BAD! You have no more guesses left. The correct word is '#{@secret_word}'."
      @is_over = true
    end
    @message
  end

end

# USER INTERFACE
# ask player 1 to provide a word
# then ask player 2 to start guess
# WHILE the game is not over
# check if guess is a duplicate
# then check the input
# check if the player has won for each loop

puts "This is a 2-player game."
puts "Player 1 - Please type a word for Player 2 to guess:"
word = gets.chomp.downcase
game = GuessingGame.new(word)
system("clear")   # clears the page after Player 1 types the word
puts "Player 2 -"

while !game.is_over
  puts "You have #{game.guesses_left} guess(es) left."
  puts "Make a guess (1 character at a time): #{game.blanks}"
  player2_input = gets.chomp

  if !game.char_previously_guessed?(player2_input)
    puts "#{game.check_guess(player2_input)}"
    puts "#{game.result}"
  end
  
end