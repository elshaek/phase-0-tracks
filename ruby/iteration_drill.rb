# Array Drills

zombie_apocalypse_supplies = ["hatchet", "rations", "water jug", "binoculars",
                              "shotgun", "compass", "CB radio", "batteries"]

# 1. Iterate through the zombie_apocalypse_supplies array,
# printing each item in the array separated by an asterisk
# ----
zombie_apocalypse_supplies.each do |item| 
	if item == zombie_apocalypse_supplies[-1]
		print item 		# last element will not print asterisk
	else
	  print item, "*"
	end
end
puts "\n"


# 2. In order to keep yourself organized, sort your zombie_apocalypse_supplies
# in alphabetical order. Do not use any special built-in methods.
# ----
in_order = true

while in_order == true
	in_order = false

	# if first letter of current element is not in alphabetical order, swap the elements
	# repeat process until all are in order
	# compare letters in the same case form (downcase or uppercase)
	(zombie_apocalypse_supplies.length-1).times do |item|
		if zombie_apocalypse_supplies[item][0].downcase > zombie_apocalypse_supplies[item+1][0].downcase
			zombie_apocalypse_supplies[item], zombie_apocalypse_supplies[item+1] = zombie_apocalypse_supplies[item+1], zombie_apocalypse_supplies[item]
			in_order = true

		# if more than 1 item starts with the same letter, compare the second letter in the word
		elsif zombie_apocalypse_supplies[item][0].downcase == zombie_apocalypse_supplies[item+1][0].downcase
			if zombie_apocalypse_supplies[item][1].downcase > zombie_apocalypse_supplies[item+1][1].downcase
				zombie_apocalypse_supplies[item], zombie_apocalypse_supplies[item+1] = zombie_apocalypse_supplies[item+1], zombie_apocalypse_supplies[item]
				in_order = true
			end
		end
	end	
end

p zombie_apocalypse_supplies


# 3. Create a method to see if a particular item (string) is in the
# zombie_apocalypse_supplies. Do not use any special built-in methods.
# For instance: are boots in your list of supplies?
# ----
def in_supply?(supplies_arr, item)
	available = false
	
	supplies_arr.each do |supply|
		if supply == item
			available = true
		end
	end
	available
end

puts in_supply?(zombie_apocalypse_supplies, "rations")


# 4. You can't carry too many things, you've only got room in your pack for 5.
# Remove items in your zombie_apocalypse_supplies in any way you'd like,
# leaving only 5. Do not use any special built-in methods.
# ----
reduced_supplies = []
zombie_apocalypse_supplies.each do |item|
	if reduced_supplies.length < 6
		reduced_supplies << item
	end
end
p reduced_supplies


# 5. You found another survivor! This means you can combine your supplies.
# Create a new combined supplies list out of your zombie_apocalypse_supplies
# and their supplies below. You should get rid of any duplicate items.
# Find the built-in method that helps you accomplish this in the Ruby
# documentation for Arrays.
other_survivor_supplies = [ "warm clothes", "rations", "compass", "camp stove",
                            "solar battery", "flashlight"]
# ----
p zombie_apocalypse_supplies.concat(other_survivor_supplies).uniq



# Hash Drills

extinct_animals = {
  "Tasmanian Tiger" => 1936,
  "Eastern Hare Wallaby" => 1890,
  "Dodo" => 1662,
  "Pyrenean Ibex" => 2000,
  "Passenger Pigeon" => 1914,
  "West African Black Rhinoceros" => 2011,
  "Laysan Crake" => 1923
}

# 1. Iterate through extinct_animals hash, printing each key/value pair
# with a dash in between the key and value, and an asterisk between each pair.
# ----
extinct_animals.each do |animal, year|
	if year == extinct_animals.flatten[-1]
		print "#{animal} - #{year}" 		# last element will not print asterisk
	else
	  print "#{animal} - #{year} * "
	end
end
puts "\n"

# 2. Keep only animals in extinct_animals if they were extinct before
# the year 2000. Do not use any special built-in methods.
# ----
extinct_before_2000 = {}
extinct_animals.each do |animal, year|
	if year < 2000
		extinct_before_2000[animal] = year
	end
end

p extinct_before_2000


# 3. Our calculations were completely off, turns out all of those animals went
# extinct 3 years before the date provided. Update the values in extinct_animals
# so they accurately reflect what year the animal went extinct.
# Do not use any special built-in methods.
# ----
extinct_animals.each do |animal, year|
	extinct_animals[animal] = year - 3
end

p extinct_animals


# 4. You've heard that the following animals might be extinct, but you're not sure.
# Check if they're included in extinct_animals, one by one:
# "Andean Cat"
# "Dodo"
# "Saiga Antelope"
# Do not use any special built-in methods.
# ----

extinct_or_not = [ "Andean Cat", "Dodo", "Saiga Antelope"]

extinct_or_not.each do |input|
	extinct_animals.each do |animal, year|
		if input == animal
			puts "The #{input} is an extinct animal."
		end
	end
end


# 5. We just found out that the "Passenger Pigeon" is actually not extinct!
# Remove them from extinct_animals and return the key value pair as a two item array.
# Find the built-in method that helps you accomplish this in the Ruby documentation
# for Hashes.
# ----