# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

seed_users = [
  {name: "Lucy", last_name: "Moulan", email: "misstamar@gmail.com", room_id: 1},
  {name: "Dora", last_name: "Moulan", email: "misstamar@gmail.com", room_id: 2},
  {name: "Tammy", last_name: "Hershenbaum", email: "misshershi@gmail.com", room_id: 2}
]
seed_users.each do |teacher|
  User.create(teacher)
end

seed_children = [
  {name: "Michelle", last_name: "Mor", gender: "girl", room_id: 1, parent1_number: "425-247-5902",
  parent2_number: "425-247-5901", medications_sensitivity: "Advil", city: "Seattle",
  address: "12918 133rd pl NE", dob: 4/3/2012, parents_names: "Tammy and Guy", email: "misshershi@gmail.com"},
  {name: "Jone", last_name: "Andy", gender: "boy", room_id: 2, parent1_number: "425-247-5902",
  parent2_number: "425-247-5901", medications_sensitivity: "Tylanol", city: "Bellevue",
  address: "12918 133rd pl NE", dob: 5/6/2014, parents_names: "Joe and Betty", email: "misshershi@gmail.com"},
  {name: "Kaitlin", last_name: "Dowl", gender: "girl", room_id: 1, parent1_number: "425-247-5902",
  parent2_number: "425-247-5901", medications_sensitivity: "", city: "Kirkland",
  address: "12918 133rd pl NE", dob: 8/14/2013, parents_names: "Moris and Brandon", email: "misshershi@gmail.com"},
  {name: "Lena",last_name: "Mor",  gender: "girl", room_id: 2, parent1_number: "425-247-5902",
  parent2_number: "425-247-5901", medications_sensitivity: "none", city: "Woodinvlle",
  address: "12918 133rd pl NE", dob: 9/4/2012, parents_names: "She and Him", email: "misshershi@gmail.com"}
]

seed_children.each do |child|
  Child.create(child)
end

seed_rooms = [
  {name: "Rainbow"},
  {name: "Sunshine"}
]
seed_rooms.each do |room|
  Room.create(room)
end
