require 'sqlite3'

database = SQLite3::Database.new("db/robot_world_development.db")

database.execute("DELETE FROM robots")

database.execute("INSERT INTO robots
                  (name, city, state, avatar, birthdate, date_hired, department)
                  VALUES
                  ('R2D2', 'Tatooine', 'Naboo', 'r2d2', '6/13/1984', '4/15/2016', 'Awesome'),
                  ('C3PO', 'Alderan', 'Kashi', 'c3po', '2/21/1983', '8/01/2016', 'Translation');"
                )

puts "It worked and:"
p database.execute("SELECT * FROM robots;")
