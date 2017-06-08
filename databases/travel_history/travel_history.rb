# create users table for username and password
# create travel history table

require 'sqlite3'

db = SQLite3::Database.new("travel_history.db")

create_table_cmd = <<-SQL
  CREATE TABLE ID NOT EXISTS users (
    id INTEGER PRIMARY KEY,
    email VARCHAR(255),
    password VARCHAR(255)
  );

  CREATE TABLE IF NOT EXISTS travel_history (
    id INTEGER PRIMARY KEY,
    departure_date DATE,
    arrival_date DATE,
    destination VARCHAR(255),
    purpose VARCHAR(255),
    user_id INT
    FOREIGN KEY(user_id) REFERENCES users(id),
  );
SQL

db.execute(create_table_cmd)

def add_email_pw (email, password)
  db.execute("INSERT INTO users (email, password) VALUES (?, ?) ", [email, password])
end

def add_travel_info (departure, arrival, destination, purpose) # IF NOT EXISTS?
  db.execute("INSERT INTO travel_history (departure_date, arrival_date, destination, purpose) VALUES (?, ?, ?, ?)", [departure, arrival, destination_id, purpose_id])
end

# ask user to create username and password
# allow users to change password, but not username

puts "What would you like to do? (Type the corresponding number)\n
1. Create a New Account\n
2. Login"
login_input = gets.chomp


correct_user_input = false
users_array = db.execute("SELECT * FROM users")
user_id = 0
travel_data_input = 0

while !correct_user_input #do
  puts "Please enter email:"
  email_input = gets.chomp # assume correct format
  puts "Please enter password:"
  pw_input = gets.chomp

  if login_input == 1
    add_email_pw(email_input, pw_input)
  elsif login_input == 2
    users_array.each do |user_info|
      if user_info[1] == email_input && user_info[2] == pw_input
        correct_user_input = true
        user_id = user_info[0]
        puts "What would you like to do: (Type the corresponding number)\n
        1. Add new travel data\n
        2. Retrieve travel history"
        travel_data_input = gets.chomp
      else
        puts "Wrong email or password."
      end
    end
  end
end

if travel_data_input == 1
  puts "Departure date: (YYYY-MM-DD)"
  departure = gets.chomp
  puts "Arrival date: (YYYY-MM-DD)"
  arrival = gets.chomp
  puts "Country:"
  destination = gets.chomp
  puts "Purpose:"
  purpose = gets.chomp

  add_travel_info (departure, arrival, destination, purpose, user_id)
elsif travel_data_input == 2
  travel_history_array = db.execute("SELECT * FROM travel_history")
  travel_history_array.each do |travel_data|
    puts "#{travel_data[0]}. #{travel_data[1]} - #{travel_data[2]} travelled to #{travel_data[3]} for #{travel_data[4]}"
  end
end
  

# ask users for travel information: departure date, arrival date, country, purpose of travel
# let user retrieve all travel data






# USER INTERFACE