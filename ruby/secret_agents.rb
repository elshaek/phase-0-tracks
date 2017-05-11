# ENCRYPT
# loop through every letter in the argument string by using index
# if character is a space no change should be made
# for each iteration use .next! to move forward one letter and permanently change it


# DECRYPT
# store alphabets a to z as a variable
# loop through every letter in the argument string by using index
# find its position in the alphabets variable
# go to the previous letter in the alphabets variable
# replace the original letter with the new letter

def encrypt(password)
	i = 0

	while i < password.length
		# if letter is z then replace with a
		if password[i] == "z"
			password[i] = "a"
		# dont do anything to spaces
		elsif password[i] == " "
			password[i] = " "
		else
			password[i] = password[i].next!	
		end
		i += 1
	end		

	p password	# using p will give output with quotes and an implicit return with intended object
				# we can alternatively use puts password and return password, to give output without quotes and an explicit return with intended object
end


def decrypt(password)
	alphabet = "abcdefghijklmnopqrstuvwxyz"
	i = 0

	while i < password.length
		
		# if letter is a then replace with z
		if password[i] == "a"
		  password[i] = "z"
		elsif password[i] == " "
			password[i] = " "
		else
			# compare the letter from the argument to the alphabet string
			# find the position of that letter in alphabet variable
			# and then go back one position 
			index_num = alphabet.index(password[i]) - 1		#index_num is the position of the new letter in the alphabet variable
			# replacing the original letter with the new one
			password[i] = alphabet[index_num]
		end
		i += 1
	end		

	p password	# using p will give output with quotes and an implicit return with intended object
				# we can alternatively use puts password and return password, to give output without quotes and an explicit return with intended object
end


# INTERFACE
# ask user if encrypt/decrypt and ask for password
# call on the respective method with the given password as method argument
# print the encrypted/decrypted password

puts "Would you like to encrypt or decrypt?"
user_input = gets.chomp
# repeat question until user gives a valid answer of encrypt or decrypt
until user_input == "encrypt" || user_input == "decrypt"
	puts "Sorry, I don't understand. Would you like to encrypt or decrypt?" 
	user_input = gets.chomp
end

puts "what's your password?"
password = gets.chomp

if user_input == "encrypt"
	encrypt(password)
elsif user_input == "decrypt"
	decrypt(password)
else
	
end


# encrypt("hel lo")
# encrypt("zed")
# encrypt("abc")

# decrypt("ifm mp")
# decrypt("afe")
# decrypt("bcd")

# decrypt(encrypt("swordfish")) 

# ^ this nested method call works by:
# first running the innermost method, in this case encrypt
# the result from the innermost method is then replaced by the return value
# the outermost method, in this case decrypt, will then use the returned value as an argument
# and finally run the method to give the final result















