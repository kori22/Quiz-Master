# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "quiz@gmail.com", password: 'quipper123', password_confirmation: 'quipper123', username: 'quipper')
User.create(email: "developer@gmail.com", password: 'developer123', password_confirmation: 'developer123', username: 'developer')
