class Puppy
  def initialize
  	puts "Initializing new puppy instance..."
  end
  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end
  def speak(integer)
  	# puts "Woof!"*integer
  	integer.times {|i| puts "Woof!"}
  end
  def roll_over
  	puts "*Rolls Over*"
  end
  def dog_years(integer)
  	integer*7
  end
  def bark_at_mailman(decibel_level)
  	puts "Bark! Bark! Bark! (at #{decibel_level} decibels)."
  end
end

puts "Create new Puppy instance and call methods on it:"

our_puppy = Puppy.new

our_puppy.fetch("squeaky toy")
our_puppy.speak(5)
our_puppy.roll_over
puts our_puppy.dog_years(10)
our_puppy.bark_at_mailman(80)

puts "\n"



class DBC_student
	def initialize
		puts "Creating a new DBC student..."
	end

	def study(hours)
		puts "I study #{hours} hours a week."
	end

	def drink_coffee(cups_a_day)
		puts "I drink #{cups_a_day} cups of Sumatra coffee a day!"
	end
end

puts "Create 50 new instances of DBC_students and call methods on each of them:"

array_of_DBC_students = Array.new

50.times do |x| 
	array_of_DBC_students << DBC_student.new
end

puts "Number of students: #{array_of_DBC_students.length}."
puts "\n"

array_of_DBC_students.each do |student|
	student.study(25)
	student.drink_coffee(3)
end 