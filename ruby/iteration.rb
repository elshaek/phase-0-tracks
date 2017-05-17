# RELEASE 0
# Write method that takes a block
puts "_____This is Release 0_____"
def method1
	puts "Hi!"
	yield("Eric")
end

method1 { |name1| puts "How's your day, #{name1}?" }




# RELEASE 1
puts "\n_____Release 1 starts here_____"

food = ["sushi", "pasta", "fruit", "veggie"]
animals = {
	dog: "beagle",
	fish: "salmon",
	cat: "lion",
	bird: "eagle"
}

puts "Using .each and .map! on an array:"
p food

food.each do |foodtype|
	puts "#{foodtype.capitalize} is my favorite food."
end

food.map! do |foodtype|
	foodtype.capitalize + "!"
end

puts "After .map call:"
p food

puts "\nUsing .each on a hash:"
p animals

animals.each do |animaltype, animal|
	puts "#{animal.capitalize} is a type of #{animaltype}."
end




# RELEASE 2
puts "\n_____Release 2 starts here_____"
# A method that iterates through the items, deleting any that meet a certain condition 
# (for example, deleting any numbers that are less than 5).
puts "Using .delete_if on array and hash (condition: if number < 3):"
ary1 = [1, 2, 3, 4]
hash1 = {
	1 => "one",
	2 => "two",
	3 => "three",
	4 => "four"
}

puts "Original array: #{ary1}"
ary1.delete_if {|num| num < 3}
puts "After running block code: #{ary1}" # the array is changed instantly every time the block is called, not after the iteration is over


puts "Original hash: #{hash1}"
hash1.delete_if {|digit, num| digit < 3}
puts "After running block code: #{hash1}"

# A method that filters a data structure for only items that do satisfy a certain condition 
# (for example, keeping any numbers that are less than 5).
puts "\nUsing .keep_if on array and hash (condition: if number < 3):"
ary2 = [1, 2, 3, 4]
hash2 = {
	1 => "one",
	2 => "two",
	3 => "three",
	4 => "four"
}

puts "Original array: #{ary2}"
ary2.keep_if {|num| num < 3}
puts "After running block code: #{ary2}" 

puts "Original hash: #{hash2}"
hash2.keep_if {|digit, num| digit < 3}
puts "After running block code: #{hash2}"



# A different method that filters a data structure for only items satisfying a certain condition -- Ruby offers several options!
puts "\nUsing .select on array and  (condition: if number is even):"
ary3 = [1, 2, 3, 4]
hash3 = {
	1 => "one",
	2 => "two",
	3 => "three",
	4 => "four"
}

puts "Original array: #{ary3}"
ary3_1 = ary3.select {|num| num.even?}
puts "After running block code: #{ary3}"	# .select does not change the original array elements
puts "New array: #{ary3_1}"								# but result can be stored in a new variable

puts "Original hash: #{hash3}"
hash3_1 = hash3.select {|digit, num| digit.even?}
puts "After running block code: #{hash3}"
puts "New hash: #{hash3_1}"



# A method that will remove items from a data structure until the condition in the block evaluates to false, then stops
# (you may not find a perfectly working option for the hash, and that's okay).
puts "\nUsing .reject on array and hash (condition: if number < 3):"
ary4 = [1, 2, 3, 4]
hash4 = {
	1 => "one",
	2 => "two",
	3 => "three",
	4 => "four"
}

puts "Original array: #{ary4}"
ary4_1 = ary4.reject {|num| num < 3}
puts "After running block code: #{ary4}"	# .select does not change the original array elements
puts "New array: #{ary4_1}"								# but result can be stored in a new variable


puts "Original hash: #{hash4}"
hash4_1 = hash4.reject {|digit, num| digit < 3}
puts "After running block code: #{hash4}"
puts "New hash: #{hash4_1}"