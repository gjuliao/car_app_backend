# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Belay Birhanu', email: 'belay@gmail.com', password: '123456',
  password_confirmation: '123456')
second_user = User.create(name: 'Giovanni Juliao', email: 'giovani@gmail.com', password: '123456',
  password_confirmation: '123456')

third_user = User.create(name: 'Diego C', email: 'diego@gmail.com', password: '123456',
    password_confirmation: '123456')