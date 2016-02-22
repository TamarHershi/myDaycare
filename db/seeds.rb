# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

seed_users = [
  {name: "Lucy", last_name: "Moulan", email: "Lucy@gmail.com", room_id: 1},
  {name: "Dora", last_name: "Moulan", email: "Dora@gmail.com", room_id: 2}
]
seed_users.each do |teacher|
  User.create(teacher)
end

seed_children = [
  {name: "Michelle", last_name: "Mor", gender: "girl", room_id: 1},
  {name: "Jone", last_name: "Andy", gender: "boy", room_id: 2},
  {name: "Kaitlin", last_name: "Dowl", gender: "girl", room_id: 1},
  {name: "Lena",last_name: "Mor",  gender: "girl", room_id: 2}
]

seed_children.each do |child|
  Child.create(child)
end

2.times do
  Room.create
end
