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

puts "Thank you. The information you've entered are as follows: 
Name: #{client[:fullname]}
Age: #{client[:age]}
Number of Children: #{client[:num_of_children]}
Decor Theme Preference: #{client[:decor_theme]}"

puts "Would you like to update any of the above information? (type 'none' if no update)"
update_info = gets.chomp

puts "Please enter new value:"
update_val = gets.chomp

if update_info == "age" || update_info == "num_of_children"
	update_val.to_i
end

client[update_info.to_sym] = update_val

puts "Your information has been updated as follows:
Name: #{client[:fullname]}
Age: #{client[:age]}
Number of Children: #{client[:num_of_children]}
Decor Theme Preference: #{client[:decor_theme]}"
