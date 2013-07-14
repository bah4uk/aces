# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

puts 'ROLES'
["admin", "user"].each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end

puts 'Seeding user'
user = User.find_or_create_by_email :name => "Ivan", :email => "aces@example.com", :password => "aces", :password_confirmation => "aces"
puts 'DEFAULT USERS'
puts 'user: ' << user.name
user.add_role :admin


puts 'Seeding countries'
countries = ["AL","AM","AT","AZ","BY","BE","BG","HR","CY","CZ","DK","EE","FI","FR","GE","GR","HU","IT","LV","LT","MD","NL","NO","PL","PT","RO","RU","RS","SK","SI","ES","SE","CH","TR","UA","UK"]
countries.each do |name|
  Country.create!({ name: name })
end
puts "done"

puts 'Seeding categories'
categories = ["WWI", "WWII", "S500"]
categories.each do |name|
  puts "Seeding #{name}"
  Category.create!({ name: name })
end


puts 'Seeding pilots'
ids = Country.all.map(&:id)
ids.each do |country_id|
  name = Faker::Name.name
puts "Seeding #{name}"
  Pilot.create!({ name: name, country_id: ids.sample })
end
