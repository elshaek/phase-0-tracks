# 5.5 Solo Challenge: Manipulating Strings with Iteration

# BUSINESS LOGIC
# take user input and swap first and last name
# change all the vowels to the next vowel in 'aeiou'
		# store vowels in an array
		# compare each character in the name to the array
		# if character is a vowel, change it to the next vowel
# change all the consonants to the next consonant in the alphabet
		# store consonants in a string
		# compare each character in the name to the string
		# if character is a consonant, change it to the next consonant
# edge case: 'z' will become 'b'

# method to sawp first and last name
def nameswap(fullname) 
	fullname.split(" ").reverse.join(" ")
end

# method to change all the vowels to the next vowel in 'aeiou'
def next_vowel(fullname)
	name_array = fullname.downcase.chars
	vowels = ["a", "e", "i", "o", "u"]

	name_array.map! do |char|
		if vowels.include?(char)
			char_index = vowels.index(char)	# find position of the character in the vowels array
			char = vowels[char_index + 1]
		end
		char
	end
	
	new_name_array = name_array.join("")	# put the array back together to get name
	new_name_array.split.map! {|x| x.capitalize}.join(" ") # capitalize each name
end

# method to change all the consonants to the next consonant in the alphabet
def next_consonant(fullname)
	name_array = fullname.downcase.chars
	consonants = "bcdfghjklmnpqrstvwxyz"

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



# USER INTERFACE
# ask for spy's name
# return an alias
# keep asking until user types quit
# print all data before exiting program

user_input = ""
name_list = {}

until user_input.downcase == "quit"
	puts "Input name:"
	user_input = gets.chomp
	if user_input.downcase == "quit"
		name_list.each {|user_alias, user_input| puts "#{user_alias} is actually #{user_input}."} # print all data stored in the name_list hash
		exit
	elsif user_input.empty?
		# keep asking for name if no input
	else 
		user_alias = nameswap(next_consonant(next_vowel(user_input)))
		name_list[user_alias] = user_input.split.map! {|x| x.capitalize}.join(" ")	# store key-value pair to name_list hash
		puts "Your alias: #{user_alias}"
	end
end