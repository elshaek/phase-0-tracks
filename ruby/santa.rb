class Santa
	
	attr_reader	:ethnicity
	attr_accessor :age, :gender

	def initialize(gender, ethnicity)
		puts "Initializing Santa instance ..."
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
	end

	def speak
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies(cookie)
		puts "That was a good #{cookie}!"
	end

	def celebrate_birthday
		@age += 1
		puts "It's Santa's birthday!"
	end

	def get_mad_at(reindeer)
		@reindeer_ranking.delete(reindeer)
		@reindeer_ranking.insert(-1, reindeer)
	end	

	# # getter methods
	# def age
	# 	@age
	# end
	# 
	# def ethnicity
	# 	@ethnicity
	# end
	#
	# def gender
	# 	@gender
	# end
	# 
	# # setter methods
	# def gender=(new_gender)
	# 	@gender = new_gender
	# end
end

# santa = Santa.new("female", "prefer not to say")
# santa.speak
# santa.eat_milk_and_cookies("snickerdoodle")
# santa.celebrate_birthday
# puts "Age: #{santa.age}"
# puts "Ethnicity: #{santa.ethnicity}"
# puts "Santa's mad at Vixen! Move Vixen to last place #{santa.get_mad_at("Vixen")}"
# puts "Gender: #{santa.gender}"
# santa.gender = "agender"
# puts "Santa's transitioned, and is now #{santa.gender}."


genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
snacks = ["snickerdoodle", "glass of milk", "cupcake", "biscuit", "pie", "cookie"]
# santas = []
# genders.length.times do |i|
#   santas << Santa.new(example_genders[i], example_ethnicities[i])
# end

100.times do |x|
	santa = Santa.new(genders.sample, ethnicities.sample)
	santa.age = rand(0..140)
	puts "Profile for Santa #{x+1}"
	puts "Gender: #{santa.gender}"
	puts "Ethnicity: #{santa.ethnicity}"
	puts "Age: #{santa.age}"
	
	if x.odd?
		santa.speak
		santa.eat_milk_and_cookies(snacks.sample)
	else
		santa.celebrate_birthday
		puts "Santa is now #{santa.age} years old!"
		puts "Santa's mad at Vixen again! Move Vixen to last place! #{santa.get_mad_at("Vixen")}"
	end

	puts "-" * 10
end