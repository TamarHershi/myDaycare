# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

seed_users = [
  {name: "Lucy", last_name: "Moulan", email: "Lucy@gmail.com"},
  {name: "Dora", last_name: "Moulan", email: "Dora@gmail.com"}
]
seed_users.each do |teacher|
  User.create(teacher)
end

seed_children = [
  {name: "Michelle", last_name: "Mor", gender: "girl", age: 6, mom_id: 1},
  {name: "Jone", last_name: "Andy", gender: "boy", age: 2, mom_id: 2},
  {name: "Kaitlin", last_name: "Dowl", gender: "girl", age: 7, mom_id: 3},
  {name: "Lena",last_name: "Mor",  gender: "girl", age: 4, mom_id: 4}
]

seed_children.each do |child|
  Child.create(child)
end
