# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)

Workspace.create(name:"Fancy place", description: "big and beautiful and fancy", price: 100, location: "a nice city")
Workspace.create(name:"Small place", description: "little sweet hut", price: 50, location: "a nice village")
Workspace.create(name:"Professional place", description: "high-tech and rusty", price: 150, location: "the biggest city")
Workspace.create(name:"Quirky place", description: "full of Batmans", price: 200, location: "Deadpool town")
Workspace.create(name:"Pink place", description: "bling bling bling", price: 150, location: "Barbie town")
#   end
