# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Todo.destroy_all

puts "Creating todos..."
Todo.create!(title: "a", body: "a", done: false)
Todo.create!(title: "b", body: "b", done: false)
Todo.create!(title: "c", body: "c", done: false)
Todo.create!(title: "d", body: "d", done: false)
Todo.create!(title: "e", body: "e", done: false)
Todo.create!(title: "f", body: "f", done: false)
Todo.create!(title: "g", body: "g", done: false)
Todo.create!(title: "h", body: "h", done: false)
Todo.create!(title: "i", body: "i", done: false)
Todo.create!(title: "j", body: "j", done: false)

