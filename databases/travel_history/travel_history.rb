# it's hard to keep track of travel history, and it's a hassle to look for them when applying for 
# different visas. I'm creating this database so everyone in the family can can add and retrieve their 
# travel history whenever they need the information

# create users table for username and password
# create travel history table

require 'sqlite3'

db = SQLite3::Database.new("travel_history.db")
db.results_as_hash = true

create_users_table = <<-SQL
  CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY,
    email VARCHAR(255),
    password VARCHAR(255)
  );
SQL

create_travel_histories_table = <<-SQL
  CREATE TABLE IF NOT EXISTS travel_histories (
    id INTEGER PRIMARY KEY,
    departure_date DATE,
    arrival_date DATE,
    destination VARCHAR(255),
    purpose VARCHAR(255),
    user_id INT,
    FOREIGN KEY(user_id) REFERENCES users(id)
  );
SQL

db.execute(create_users_table)
db.execute(create_travel_histories_table)

def add_email_pw(email, password, db)
  db.execute("INSERT INTO users (email, password) VALUES (?, ?) ", [email, password])
end

def add_travel_info(departure, arrival, destination, purpose, user_id, db)
  db.execute("INSERT INTO travel_histories (departure_date, arrival_date, destination, purpose, user_id) VALUES (?, ?, ?, ?, ?)", [departure, arrival, destination, purpose, user_id])
end

def delete_travel_info(departure, destination, user_id, db)
  db.execute("DELETE FROM travel_histories WHERE departure_date=? AND destination=? AND user_id=?", [departure, destination, user_id])
end

def account_exists?(email, users_table_array)
  exists = false
  users_table_array.each do |user_info|
    if user_info["email"] == email
      exists = true
    end
  end
  return exists
end

def correct_password?(pw, users_table_array)
  correct = false
  users_table_array.each do |user_info|
    if user_info["password"] == pw
      correct = true
    end
  end
  return correct
end

def login(email, pw, users_table_array)
  succeed = false
  if account_exists?(email, users_table_array) && correct_password?(pw, users_table_array)
    puts "Login successful"
    succeed = true
  elsif account_exists?(email, users_table_array) || correct_password?(pw, users_table_array)
    puts "Wrong email or password"
  else
    puts "Account does not exist"
  end
  return succeed
end

def create_acc(email, pw, users_table_array, db)
  succeed = false
  if account_exists?(email, users_table_array)
    puts "Account already exists"
  else
    add_email_pw(email, pw, db)
    puts "New account created"
    succeed = true
  end
  return succeed
end

def retrieve_user_id(email, db)
  db.execute("SELECT users.id FROM users WHERE users.email=?", [email])[0]["id"]
end

def add_new_data(user_id, db)
  puts "Departure date: (YYYY-MM-DD)"
  departure = gets.chomp
  puts "Arrival date:(YYYY-MM-DD)"
  arrival = gets.chomp
  puts "Destination country:"
  country = gets.chomp
  puts "Purpose of visit:"
  purpose = gets.chomp
  add_travel_info(departure, arrival, country, purpose, user_id, db)
  puts "Travel data added"
end

def delete_travel_data(user_id, db)
  retrieve_all_data(user_id, db)
  puts "Which data would you like to delete?"
  puts "Departure date: (YYYY-MM-DD)"
  departure = gets.chomp
  puts "Destination country:"
  country = gets.chomp
  delete_travel_info(departure, country, user_id, db)
end

def retrieve_all_data(user_id, db)
  user_travel_history_array = db.execute("SELECT * FROM travel_histories WHERE travel_histories.user_id=? ORDER BY departure_date", [user_id])
  if !user_travel_history_array.empty?
    user_travel_history_array.each do |travel_info|
      puts "#{travel_info["departure_date"]} - #{travel_info["arrival_date"]}: #{travel_info["destination"]} for #{travel_info["purpose"]}"
    end
  else
    puts "No existing data"
  end
end

def delete_account(user_id, db)
  puts "Once account has been deleted, all of your user informationa and travel data
  will be permanently deleted. Would you like to continue? (y/n)"

  delete_input = gets.chomp.downcase
  if delete_input == "y"
    db.execute("DELETE FROM users WHERE id=?", [user_id])
    db.execute("DELETE FROM travel_histories WHERE id=?", [user_id])
    puts "Account has been successfully deleted"
  end
end

# USER INTERFACE
# ask user if they'd like to login or create a new account
# IF login, ask for email and password, and find and compare with data from users database
# ELSIF create new account, ask for email and password to be added to database
# and lead them to the login page after new profile has been created

login_successful = false
registration_successful = false
back_to_login = false

while !login_successful || back_to_login
  users_array = db.execute("SELECT * FROM users")

  puts "What would you like to do? (Please type number only)
  1. Login
  2. Create new profile
  3. Exit"
  user_input = gets.chomp.to_i
  
  if user_input == 1 || user_input == 2
    puts "Email:"
    email_input = gets.chomp
    puts "Password:"
    pw_input = gets.chomp
    
    if user_input == 1 || registration_successful
           
      if login_successful = login(email_input, pw_input, users_array)
        loop do 
          puts "What would you like to do? (Please type number only)
          1. Add new travel data
          2. Delete travel data
          3. Retrieve all travel data
          4. Delete account
          5. Exit"
          user_input2 = gets.chomp.to_i
          user_id = retrieve_user_id(email_input, db)
  
          if user_input2 == 1 
            add_new_data(user_id, db)
          elsif user_input2 == 2
            delete_travel_data(user_id, db)
          elsif user_input2 == 3
            retrieve_all_data(user_id, db)
          elsif user_input2 == 4
            delete_account(user_id, db)
            back_to_login = true
            break
          elsif user_input2 == 5
            exit
          else
            puts "You did not enter a valid number."
          end  
        end
      end
    elsif user_input == 2
      registration_successful = create_acc(email_input, pw_input, users_array, db)
    end

  elsif user_input == 3
    exit
  else
    puts "You did not enter a valid number."
  end
end
