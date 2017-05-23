# GPS 2.2 - Electronic Grocery List

# RELEASE 0

# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
	# Separate string into individual words as array
	# Create new list hash
	# Iterate through each item and use items as keys
	# set default quantity to 0
	# print the list to the console [can you use one of your other methods here?]
# output: hash

def create_list(grocerylist)
	grocerylist_arr = grocerylist.split
	list = Hash.new
	grocerylist_arr.each do |item|
		list[item] = 0
	end
	p list
end

example_list = create_list("carrots apples cereal pizza")

# Method to add an item to a list
# input: list, item name, and optional quantity
# steps:
	# Add item name and quantity to the list hash
# output: updated list

def add_item(list, item, quantity=0)
	list[item] = quantity
	list
end

p add_item(example_list, "pear")

# Method to remove an item from the list
# input: list, item name
# steps:
	# Remove item name and quantity (if any) from the list
# output: updated list

def remove_item(list, item)
	list.delete(item)
	list
end

p remove_item(example_list, "pear")

# Method to update the quantity of an item
# input: list, item name, quantity
# steps:
 	# Change key-value pair in the hash to the new values
# output: updated list

def update_quantity(list, item, quantity)
	list[item] = quantity
	list
end

p update_quantity(example_list, "pizza", 3)

# Method to print a list and make it look pretty
# input: list hash
# steps: 
	# print list with formatting
	# iterate through hash
	# add string to make look fancy
# output: none

def print_list(list)
	list.each do |item, quantity|
		puts "#{item.capitalize}: #{quantity}"
	end
end

print_list(example_list)


new_list = create_list("")

add_item(new_list, "lemonade", 2)
add_item(new_list, "tomatoes", 3)
add_item(new_list, "onions", 1)
add_item(new_list, "ice cream", 4)

remove_item(new_list, "lemonade")

update_quantity(new_list, "ice cream", 1)

print_list(new_list)