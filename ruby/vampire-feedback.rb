#This is good, try having your variable names without abreviations; `total_employees`
###num_of_emp = 0

#Does this need to be in a loop?
###until num_of_emp > 0
	puts "How many employees will be processed?"
	total_employees = gets.chomp.to_i
###end

#For loops are good for other languages, though in Ruby we really should never need one as there are more idiomatic / conventional approaches.
#Look into the times loop - ruby-doc.org/core-2.2.0/Integer.html#method-i-times
###for i in (1..num_of_emp)
total_employees.times do |i|

	puts "Processing Employee No. #{i+1}"

	#For the name it looks like you are dealing with a first/last so be sure to give an example of input
	puts "What is your name?"
	fullname = gets.chomp.split.map{|x| x.capitalize}.join(' ')

	age = 0
	until age > 0
		puts "How old are you?"
		age = gets.chomp.to_i
	end

	birth_year = Time.now.year
	until birth_year < Time.now.year
		puts "What year were you born? (yyyy)"
		birth_year = gets.chomp.to_i
	end

	if Time.now.year - birth_year == age
		correct_age = true
	else
		correct_age = false
	end

	garlic = ""
	while garlic != "y" && garlic != "n"
		puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
		garlic = gets.chomp.downcase
	end

	#Like this approach, here is a shorter version leveraging return values

	#can_eat_garlic = garlic == 'y'

	can_eat_garlic = garlic == "y"

	###if garlic == "y"
	###	can_eat_garlic = true
	###else
	###	can_eat_garlic = false
	###end

	insurance = ""
	while insurance != "y" && insurance != "n"
		puts "Would you like to enroll in the company’s health insurance? (y/n)"
		insurance = gets.chomp.downcase
	end

	will_get_insurance = insurance == "y"

	###if insurance == "y"
	###	will_get_insurance = true
	###else
	###	will_get_insurance = false
	###end



	if correct_age && (can_eat_garlic || will_get_insurance)
		#Great, like this approach of setting a vampire variable to return at the end
		vampire = "Probably not a vampire."
	elsif !correct_age && (!can_eat_garlic || !will_get_insurance)
		vampire = "Probably a vampire."
	else
		vampire = "Results inconclusive."
	end


	allergy = ""
	until allergy == "done" || allergy == "sunshine"
		puts "Do you have any allergies? (Please type 'done' when you have finished)"
		allergy = gets.chomp.downcase
		if allergy == "sunshine"
			vampire = "Probably a vampire."
		elsif allergy == "done"
			break
		end
	end

	if !correct_age && !can_eat_garlic && !will_get_insurance
		vampire = "Almost certainly a vampire."
	end

	#This may help if we had more names
	#bad_names = ['a','b','c','d','e']
	# if bad_names.include?(fullname)

	###if fullname == "Drake Cula" || fullname == "Tu Fang"
	###	vampire = "Definitely a vampire."
	###end

	bad_names = ["Drake Cula", "Tu Fang"]

	if bad_names.include?(fullname)
		vampire = "Definitely a vampire."
	end
	

	puts vampire

###	i += 1
end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
