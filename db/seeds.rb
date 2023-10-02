# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create(email: "1@gmail.com", first_name: "User", last_name: "One", password: "123", password_confirmation: "123")
user2 = User.create(email: "2@gmail.com", first_name: "User", last_name: "Two", password: "123", password_confirmation: "123")
Event.create(creator: user1, name: "Event 1", description: "Funi event", start_date: Date.new(2023,1,1))
Event.create(creator: user2, name: "Event 2", start_date: Date.new(2023,1,2))
