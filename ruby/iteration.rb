# RELEASE 0
# Write your own method that takes a block
#
#def method1
#	puts "Hi, how are you?"
#	yield
#end
#
#method1 { puts "How's your day?" }


# RELEASE 1
#
#food = ["sushi", "pasta", "fruit", "veggie"]
#p food
#
#food.each do |foodtype|
#	puts "#{foodtype.capitalize} is my favorite food."
#end
#
#modified_food = food.map do |foodtype|
#	foodtype.capitalize + "!"
#end
#
#puts modified_food
#
#
#
#animals = {
#	dog: "beagle",
#	fish: "salmon",
#	cat: "lion",
#	bird: "eagle"
#}
#p animals
#
#animals.each do |animaltype, animal|
#	puts "#{animal.capitalize} is a type of #{animaltype}."
#end


# RELEASE 2

# A method that iterates through the items, deleting any that meet a certain condition (for example, 
# deleting any numbers that are less than 5).
ary1 = [1, 2, 3, 4]

hash1 = {
	"1" => "one",
	"2" => "two",
	"3" => "three",
	"4" => "four"
}

p ary1
def numbers_half(ary1)
	ary1.delete_if {|num| num < 3}
end
p numbers_half(ary1)


p hash1
hash1.delete_if {|digit, num| digit.to_i == 2}
p hash1

# A method that filters a data structure for only items that do satisfy a certain condition 
# (for example, keeping any numbers that are less than 5).
ary2 = [1, 2, 3, 4]

hash2 = {
	"1" => "one",
	"2" => "two",
	"3" => "three",
	"4" => "four"
}

p ary2
ary2.keep_if {|num| num < 3}
p ary2 #

p hash2
hash2.keep_if {|digit, num| digit.to_i == 2}
p hash2 



# A different method that filters a data structure for only items satisfying a certain condition -- Ruby offers several options!
ary3 = [1, 2, 3, 4]

hash3 = {
	"1" => "one",
	"2" => "two",
	"3" => "three",
	"4" => "four"
}

p ary3
ary3_1 = ary3.select {|num| num.even?}
p ary3 			# .select does not change the original array elements
p ary3_1		# but result can be stored in a new variable

p hash3
hash3_1 = hash3.select {|digit, num| digit.to_i.even?}
p hash3
p hash3_1



# A method that will remove items from a data structure until the condition in the block evaluates to false, 
# then stops (you may not find a perfectly working option for the hash, and that's okay).
ary4 = [1, 2, 3, 4]

hash4 = {
	1 => "one",
	2 => "two",
	3 => "three",
	4 => "four"
}

p ary4
ary4_1 = ary4.drop_while {|num| num < 3}
p ary4
p ary4_1


p hash4
hash4_1 = hash4.drop_while {|digit, num| digit == 3}
p hash4
p hash4_1