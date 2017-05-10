puts "Hamster program"

puts "What is the name of the Hamster"
ham_name = gets.chomp

# repeat question until answer given is between 1 - 10
begin 
	puts "How loud is this Hamster on a scale of 1 to 10?"
	volume = gets.chomp.to_i
end until 0 < volume && volume < 11

puts "What color is the Hamster's fur?"
color = gets.chomp

puts "Is the hamster a good candidate for adoption? (y/n)"
adopt = gets.chomp
	if adopt == "y"
		can_adopt = "a good candidate for adoption"
	else 
		can_adopt = "not a good candidate for adoption"
	end

puts "What is its estimated age?"
age = gets.chomp.to_i
	if age == 0
		age = nil
		estimated_age = "We are not sure of the hamster's age"
	else
		estimated_age = "This hamster is #{age} years old"
	end

puts "Hamster's name is #{ham_name}.
On a loudness scale of 1 to 10, Hamster is a #{volume}.
The color of the hamster's fur is #{color}.
This Hamster is #{can_adopt}.
#{estimated_age}."