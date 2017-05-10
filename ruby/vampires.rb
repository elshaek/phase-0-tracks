# repeat Qn until number of employees is more than 0
num_of_emp = 0
until num_of_emp > 0
	puts "How many employees will be processed?"
	num_of_emp = gets.chomp.to_i
end

# repeat survey until all employees have been processed
for i in (1..num_of_emp)
	puts "Processing Employee No. #{i}"

	# gather employee's information

	puts "What is your name?"
	fullname = gets.chomp.split.map{|i| i.capitalize}.join(' ')

	# repeat Qn until age is more than 0
	age = 0
	until age > 0
		puts "How old are you?"
		age = gets.chomp.to_i
	end  
	
	# repeat Qn until birth year is less than current year 
	birth_year = Time.now.year
	until birth_year < Time.now.year 
		puts "What year were you born? (yyyy)"
		birth_year = gets.chomp.to_i
	end 
	
	# check if age and year line up
	if Time.now.year - birth_year == age
		correct_age = true
	else 
		correct_age = false
	end

	# repeat Qn while answer is not "y" or "n"
	garlic = ""
	while garlic != "y" && garlic != "n"
		puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
		garlic = gets.chomp.downcase
	end 
	
	if garlic == "y"
		can_eat_garlic = true
	else
		can_eat_garlic = false
	end

	# repeat Qn while answer is not "y" or "n"
	insurance = ""
	while insurance != "y" && insurance != "n"
		puts "Would you like to enroll in the company’s health insurance? (y/n)"
		insurance = gets.chomp.downcase
	end 

	if insurance == "y"
		will_get_insurance = true
	else
		will_get_insurance = false
	end


	# evaluate if employee is a vampire or not based on answers

	if correct_age && (can_eat_garlic || will_get_insurance)
		vampire = "Probably not a vampire."
	elsif !correct_age && (!can_eat_garlic || !will_get_insurance)
		vampire = "Probably a vampire."
	else
		vampire = "Results inconclusive."
	end 
	

	# keep asking employee for allergies until they're done, or until they type sunshine
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

	# employee name takes precedence over other criteria
	if fullname == "Drake Cula" || fullname == "Tu Fang"
		vampire = "Definitely a vampire."
	end

	puts vampire

	i += 1
end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."