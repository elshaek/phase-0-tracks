# create users table for username and password
# create travel history table

require 'sqlite3'

db = SQLite3::Database.new("travel_history.db")

create_table_cmd = <<-SQL
  CREATE TABLE ID NOT EXISTS users (
    id INTEGER PRIMARY KEY,
    username VARCHAR(255),
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

def add_username_pw (username, password)
  db.execute("INSERT INTO users (username, password) VALUES (?, ?) ", [username, password])
end

def add_travel_info (departure, arrival, destination, purpose)
  db.execute("INSERT INTO travel_history (departure_date, arrival_date, destination, purpose) VALUES (?, ?, ?, ?)", [departure, arrival, destination_id, purpose_id])
end


# ask user to create username and password
# allow users to change password, but not username

# ask users for travel information: departure date, arrival date, country, purpose of travel
# allow users to add, delete, update information
# let user retrieve all travel data if they ask






# USER INTERFACE