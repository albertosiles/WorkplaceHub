# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)

puts "seeding"

Booking.destroy_all
Workspace.destroy_all
User.destroy_all

user_Sarah = User.create!(name: "Sarah", email: "sarah@lewagon.com", is_owner: true, password: "xxx111")
user_Kathy = User.create!(name: "Kathy", email: "kathy@lewagon.com", is_owner: true, password: "xxx222")
user_Brian = User.create!(name: "Brian", email: "brian@lewagon.com", is_owner: true, password: "xxx333")

Workspace.create!(name:"Fancy place", description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.", price: 100, location: "a nice city", user: user_Sarah)
Workspace.create!(name:"Small place", description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.", price: 50, location: "a nice village", user: user_Sarah)
Workspace.create!(name:"Professional place", description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.", price: 150, location: "the biggest city", user: user_Kathy)
Workspace.create!(name:"Quirky place", description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.", price: 200, location: "Deadpool town", user: user_Brian)
Workspace.create!(name:"Pink place", description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.", price: 150, location: "Barbie's town", user: user_Brian)

puts "stop seeding"


#   end
