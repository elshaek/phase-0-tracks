puts "How many employees will be processed?"
num_of_emp = gets.chomp.to_i

# repeat survey until all employees have been processed
for i in (1..num_of_emp)

	# gather employee's information

	puts "What is your name?"
	fullname = gets.chomp

	puts "How old are you?"
	age = gets.chomp.to_i

	puts "What year were you born? (yyyy)"
	birth_year = gets.chomp.to_i
	if Time.now.year - birth_year == age
		correct_age = true
	else 
		correct_age = false
	end

	puts "Our company cafeteria serves garlic bread. Should we order some for you?(y/n)"
	garlic = gets.chomp
	if garlic == "y"
		can_eat_garlic = true
	else
		can_eat_garlic = false
	end

	puts "Would you like to enroll in the company’s health insurance? (y/n)"
	insurance = gets.chomp
	if insurance == "y"
		will_get_insurance = true
	else
		will_get_insurance = false
	end


	# evaluate if vampire or not based on answers

	if correct_age && (can_eat_garlic || will_get_insurance)
		vampire = "Probably not a vampire."
	elsif !correct_age 
		if !can_eat_garlic && !will_get_insurance
			vampire = "Almost certainly a vampire."
		elsif !can_eat_garlic || !will_get_insurance
			vampire = "Probably a vampire."
		end
	else
		vampire = "Results inconclusive."
	end 

	if fullname == "Drake Cula" || fullname == "Tu Fang"
		vampire = "Definitely a vampire."
	end

	# keep asking employee for allergies until they're done, or until they type sunshine
	begin
		puts "Do you have any allergies?"
		allergy = gets.chomp
		if allergy == "done" then
			break
		elsif allergy == "sunshine"
			vampire = "Probably a vampire."
		end
	end until allergy == "done" || allergy == "sunshine"

	puts vampire

	i += 1
end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."