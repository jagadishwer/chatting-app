# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserSignUp.new(name: "user1", email: "user1@test.com", password: "123456").save
UserSignUp.new(name: "user2", email: "user2@test.com", password: "123456").save
UserSignUp.new(name: "user3", email: "user3@test.com", password: "123456").save
UserSignUp.new(name: "user4", email: "user4@test.com", password: "123456").save