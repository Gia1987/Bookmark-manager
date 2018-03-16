require 'pg'

task :test_database_setup do
# p 'Cleaning database...'
# connect to the database
connection = PG.connect(dbname: 'bookmark_manager_test')

# clear the test data
connection.exec('TRUNCATE links;')

# Insert test data
connection.exec("INSERT INTO links VALUES(1, 'http://www.makersacademy.com', 'Makers Academy');")
connection.exec("INSERT INTO links VALUES(2, 'http://www.google.com', 'Google');")
connection.exec("INSERT INTO links VALUES(3, 'http://www.facebook.com', 'Facebook');")
end

task :setup do
  p "Creating databases..."
  connection = PG.connect
  connection.exec("CREATE DATABASE bookmark_manager;")
  connection.exec('CREATE DATABASE bookmark_manager_test;')

  connection = PG.connect(dbname: 'bookmark_manager')
  connection.exec("CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));")

  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));")
end
# ['bookmark_manager', 'bookmark_manager_test'].each do |database|
#    connection = PG.connect
#    connection.exec("CREATE DATABASE #{ database };")
#    connection = PG.connect(dbname: database)
#    connection.exec("CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60));")
#  end
# end
