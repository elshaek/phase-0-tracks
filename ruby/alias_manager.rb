# RELEASE 0: Attempt a Tricky Algorithm

# BUSINESS LOGIC
# take user input and swap first and last name
# change all the vowels to the next vowel in 'aeiou'
# change all the consonants to the next consonant in the alphabet
# 'z' will become 'b'

def nameswap(fullname) 
	fullname.split(" ").reverse.join(" ")
end


def next_vowel(fullname)
	name_array = fullname.chars
	vowels = ["a", "e", "i", "o", "u"]

	name_array.map! do |char|
		if vowels.include?(char)
			char_index = vowels.index(char)
			char = vowels[char_index + 1]
		end
		char
	end
	
	name_array.join("")
end

def next_consonant(fullname)
	name_array = fullname.chars
	consonants = "bcdfghjklmnpqrstvwxyz"

	name_array.map! do |char|
		if consonants.include?(char)
			char_index = consonants.index(char)
			char = consonants[char_index + 1]
		end
		char
	end
	
	name_array.join("")
end

puts next_consonant("hello")

# USER INTERFACE
# ask for spy's name
# return an alias

#puts "Input name:"
#user_input = gets.chomp
#puts "Your alias: #{methodname}"