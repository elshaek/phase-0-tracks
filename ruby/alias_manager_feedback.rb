# FEEDBACK

=begin
I really appreciated the fact that you made note of your edge cases ("u" and "z") 
as a part of your planning phase. It is really important to make note of those 
potential exceptions so that you remember to account for them in your code. Your 
pseudocode can also be pretty informative when it comes to writing tests so that 
you remember to incorporate tests for those important edge cases into your test suite.

Is there any particular reason why you chose to work with the vowels as an array and 
consonants as a string? Neither choice is necessarily better or worse than the other. 
I am just a big proponent of consistency in your code, especially when you are 
basically performing the exact same process when you are translating vowels as when 
you are translating consonants.

Because the code in your next_vowel method is basically identical to the code in 
your next_consonant method with the exception of the collection of letters you are 
working with, you might consider building a more generic abstraction of the two 
methods called next_letter. Next_letter could take both the letter to translate 
and the collection of letters to use as parameters and return the appropriate next 
letter. This would prevent you from having to duplicate the same code twice.

I would also suggest building another "master" method that runs all the smaller 
methods that do the entire name translation process. That way, complex method 
chains like the following: nameswap(next_consonant(next_vowel(user_input))) can be 
obfuscated within another method so you don't have to type all of that out 
everywhere you want to translate a name. That would also future-proof your code 
because if the algorithm for translating names ever changed and you needed to 
update that method chain, you would only need to update it in one place (inside 
the new method where it is called) instead of throughout the application. 
In addition, having a "master" method would provide a more logical place for you 
to rejoin and capitalize the names instead of including that behavior in the 
next_vowel and next_consonant methods.

Always be sure to clean up your code when you are finished. In your UI loop, it 
looks like you intended to handle a case where the user input was empty, but never 
did. It is okay to comment out that code if you did not get around to completing 
it before submitting the challenge. 

Great job choosing a hash to store your name/alias pairs here. Hashes are great 
for storing associated data because you can point a key directly at a value, and 
so the two pieces of data always remain linked. As with arrays in Ruby, there are 
many built in methods that simplify iterating through hashes, making it rather 
simple to iterate over a hash and print or manipulate the data stored in each 
key/value pair.
=end





# 5.5 Solo Challenge: Manipulating Strings with Iteration

# BUSINESS LOGIC
# take user input and swap first and last name
# change all the vowels to the next vowel in 'aeiou'
		# store vowels in an array
		# compare each character in the name to the array
		# if character is a vowel, change it to the next vowel
		# edge case: 'u' will become 'a'
# change all the consonants to the next consonant in the alphabet
		# store consonants in a string
		# compare each character in the name to the string
		# if character is a consonant, change it to the next consonant
		# edge case: 'z' will become 'b'

# method to swap first and last name
def nameswap(fullname) 
	fullname.split(" ").reverse.join(" ")
end

# SOLUTION 1
=begin
# method to change all the vowels to the next vowel in 'aeiou'
def next_vowel(fullname)
	name_array = fullname.downcase.chars
	vowels = ["a", "e", "i", "o", "u"]

	name_array.map! do |char|
		if vowels.include?(char)
			char_index = vowels.index(char)	# find position of the character in the vowels array

			# 'u' will become 'a'
			if char == "u"
				char = "a"
			else 
				char = vowels[char_index + 1]
			end
		end
		char
	end
	
	new_name_array = name_array.join("")	# put the array back together to get name
	new_name_array.split.map! {|x| x.capitalize}.join(" ") # capitalize each name
end

# method to change all the consonants to the next consonant in the alphabet
def next_consonant(fullname)
	name_array = fullname.downcase.chars
	consonants = "bcdfghjklmnpqrstvwxyz".chars

	name_array.map! do |char|
		if consonants.include?(char)
			char_index = consonants.index(char) # find position of the character in the consonants string

			# 'z' will become 'b'
			if char == "z"
				char = "b"
			else 
				char = consonants[char_index + 1]
			end
		end
		char
	end
	
	new_name_array = name_array.join("")	# put the array back together to get name
	new_name_array.split.map! {|x| x.capitalize}.join(" ") # capitalize each name
end
=end


# SOLUTION 2
=begin
def next_letter(fullname)
	name_str = fullname.downcase

	name_str.tr!("aeiou", "eioua")
	name_str.tr!("bcdfghjklmnpqrstvwxyz", "cdfghjklmnpqrstvwxyzb")

	name_str.split.map! {|x| x.capitalize}.join(" ")
end
=end


# SOLUTION 3

def next_letter(fullname)
	name_array = fullname.downcase.chars
	alphabets = ("a".."z").to_a
	vowels = "aeiou".chars
	consonants = alphabets - vowels
	comparison_arr = []

	name_array.map! do |char|

		if vowels.include?(char)
			comparison_arr = vowels

		elsif consonants.include?(char)
			comparison_arr = consonants
		end

		# 'u' will become 'a'
		if char == "u"
			char = "a"

		# 'z' will become 'b'
		elsif char == "z"
			char = "b"	

		elsif char == " "
			char			

		else
			char_index = comparison_arr.index(char)	# find position of the character in the vowels or consonants string
			char = comparison_arr[char_index + 1]

		end
	end
	
	new_name_array = name_array.join("")	# put the array back together to get name
	new_name_array.split.map! {|x| x.capitalize}.join(" ") # capitalize each name
end

def create_alias(fullname)
	fullname = nameswap(fullname)
	next_letter(fullname)
end



# USER INTERFACE
# ask for spy's name
# return an alias
# keep asking until user types quit
# print all data before exiting program

user_input = ""
name_list = {}

until user_input.downcase == "quit"
	puts "Input name: (or type 'quit' to exit program)"
	user_input = gets.chomp
	if user_input.downcase == "quit"
		name_list.each {|user_alias, user_input| puts "#{user_alias} is actually #{user_input}."} # print all data stored in the name_list hash
		exit

	elsif !user_input.empty?
		user_alias = create_alias(user_input)
		name_list[user_alias] = user_input.split.map! {|x| x.capitalize}.join(" ")	# store key-value pair to name_list hash
		puts "Your alias: #{user_alias}"
	end
end