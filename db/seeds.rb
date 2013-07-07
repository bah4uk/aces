# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'Seeding countries'
countries = ["AL","AM","AT","AZ","BY","BE","BG","HR","CY","CZ","DK","EE","FI","FR","GE","GR","HU","IT","LV","LT","MD","NL","NO","PL","PT","RO","RU","RS","SK","SI","ES","SE","CH","TR","UA","UK"]
countries.each do |name|
  puts "Seeding #{name}"
  Country.create!({ name: name })
end
