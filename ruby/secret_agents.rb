# ENCRYPT

# Loop through every letter using index
# for each iteration use .next (use bang operator OR store in new variable)
# to move letter one forward
# IF character is a space no change should be made

# DECRYPT

# store alphabet as a variable
# loop through every letter to find it's position in alphabet
# then -1 on the index on the decryption to get the original word


# INTERFACE

# Puts question
# IF ELSE for encrypt/decrypt
# puts password store in variable
# runs method on password and prints


def encrypt(word)
	index = 0

		while index < word.length
			
			# if letter is z replace with a
			if word[index] == "z"
				word[index] = "a"
			# dont do anything to spaces
			elsif word[index] == " "
				word[index] = " "

			else
				word[index] = word[index].next!	
			end

			index += 1

		end		

	p word
end

#encrypt("hel lo")

#encrypt("zed")

#encrypt("abc")

def decrypt(word)
	alphabet = "abcdefghijklmnopqrstuvwxyz"

	i = 0

		while i< word.length
			
			# the opposite - if a replace with z
			if word[i] == "a"
			  word[i] = "z"
			elsif word[i] == " "
				word[i] = " "
			else
				# compare the letter to the alphabet to find it's position 
				# and then go back one. 
				index_num = alphabet.index(word[i]) - 1
				# replacing the original letter with the new one
				word[i] = alphabet[index_num]
			end

			i += 1

		end		

	p word
end

puts "Would you like to encrypt or decrypt?"
user_input = gets.chomp

puts "what's your password?"
word = gets.chomp

if user_input == "encrypt"
	encrypt(word)
elsif user_input == "decrypt"
	decrypt(word)
else
	puts "sorry, I don't understand" 
end

#decrypt("ifm mp")

#decrypt("afe")

#decrypt("bcd")

#decrypt(encrypt("swordfish")) 

# ^ This works because it's calling decrypt on the encrypted swordfish. 
# First it starts the decryption and when looking for the argument it realizes
# it needs to get the encrypted value of swordfish , then takes the encrypted 
# value and decrypts it returning "swordfish". Because the encrypt method has 
# print statement in it it also returns the encrypted version. 














