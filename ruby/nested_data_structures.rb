highway = {
	car1: {
		make: "Toyota",
		model: "Alphard",
		color: "black",
		year: 2014,
		seats: {
			capacity: 7,
			occupied: 3
		},
		people: {
			driver: "driver",
			passengers: ["passenger1", "passenger2"]
		}
	},

	car2: {
		make: "Toyota",
		model: "Kijang",
		color: "silver",
		year: 2015,
		seats: {
			capacity: 5,
			occupied: 2
		},
		people: {
			driver: "driver",
			passengers: ["passenger1"]
		}
	},

	car3: {
		make: "Honda",
		model: "Civic",
		color: "maroon",
		year: 2017,
		seats: {
			capacity: 5,
			occupied: 5
		},
		people: {
			driver: "driver",
			passengers: ["passenger1", "passenger2", "passenger3", "passenger4"]
		}
	}
}

# make and model of car1
puts "Car 1 is a #{highway[:car1][:make]} #{highway[:car1][:model]}."

# number of passengers in cars 2 and 3
puts "There is #{highway[:car2][:seats][:occupied]-1} passenger in car 2."
puts "There are #{highway[:car3][:people][:passengers].length} passengers in car 3."

# passenger in the backseat of car 1 (assuming index 0 refers to front seat)
puts "These are passengers sitting in the back seat of car 3: #{highway[:car3][:people][:passengers]}"

# add another passenger to car 2
puts "Passengers currently in car 2: #{highway[:car2][:people][:passengers]}"
highway[:car2][:people][:passengers] << "passenger2"
puts "Adding passenger2 to car 2.
Passengers currently in car 2: #{highway[:car2][:people][:passengers]}"

