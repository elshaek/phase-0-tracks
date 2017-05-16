# ask for the details of a given client: the client's name, age, number of children, decor theme
# convert any user input to the appropriate data type
# store answers in hash paired with appropriate keys
# print the hash once all questions are answered

# allow user 1 chance to update information for the requested label
# reprint the hash after update and exit
# if no update, exit program

client = {}

puts "Name:"
client[:fullname] = gets.chomp

puts "Age:"
client[:age] = gets.chomp.to_i

puts "Number of Children:"
client[:num_of_children] = gets.chomp.to_i

puts "Decor Theme:"
client[:decor_theme] = gets.chomp

puts "Need Childproofing: (y/n)"
client[:childproof] = gets.chomp

if client[:childproof] == "y"
	client[:childproof] = true
elsif client[:childproof] == "n"
	client[:childproof] = false
end

puts "Thank you. The information you've entered are as follows: 
Name: #{client[:fullname]}
Age: #{client[:age]}
Number of Children: #{client[:num_of_children]}
Decor Theme Preference: #{client[:decor_theme]}
Childproof: #{client[:childproof]}"

puts "Would you like to update any of the above information? (type 'none' if no update)"
update_info = gets.chomp.downcase

if update_info == "none"
	puts "No change in data. Exiting program."
	exit
else
	puts "Please enter new value:"
	update_val = gets.chomp
end

client[update_info.to_sym] = update_val

puts "Your information has been updated to the following:
Name: #{client[:fullname]}
Age: #{client[:age]}
Number of Children: #{client[:num_of_children]}
Decor Theme Preference: #{client[:decor_theme]}
Childproof: #{client[:childproof]}"
