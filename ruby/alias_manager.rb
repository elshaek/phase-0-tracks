# 5.5 Solo Challenge: Manipulating Strings with Iteration

# BUSINESS LOGIC
# take user input and swap first and last name
# change all the vowels to the next vowel in 'aeiou'
# change all the consonants to the next consonant in the alphabet
# edge case: 'z' will become 'b'

def nameswap(fullname) 
	fullname.split(" ").reverse.join(" ")
end



def next_vowel(fullname)
	name_array = fullname.downcase.chars
	vowels = ["a", "e", "i", "o", "u"]

	name_array.map! do |char|
		if vowels.include?(char)
			char_index = vowels.index(char)
			char = vowels[char_index + 1]
		end
		char
	end
	
	new_name_array = name_array.join("")	# put the array back together to get name
	new_name_array.split.map! {|x| x.capitalize}.join(" ") # capitalize each name
end



def next_consonant(fullname)
	name_array = fullname.downcase.chars
	consonants = "bcdfghjklmnpqrstvwxyz"

	name_array.map! do |char|
		if consonants.include?(char)
			char_index = consonants.index(char)

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

user_input = ""
until user_input.downcase == "quit"
	puts "Input name:"
	user_input = gets.chomp
	if user_input.downcase == "quit"
		exit
	elsif user_input.empty?
		# keep asking for name
	else 
		puts "Your alias: #{nameswap(next_consonant(next_vowel(user_input)))}"
	end
end