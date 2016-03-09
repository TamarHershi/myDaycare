# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

seed_users = [
  {name: "Lucy", last_name: "Moulan", email: "m@gmail.com", room_id: 2, provider: "google", user_type: "t"},
  {name: "Dora", last_name: "Moulan", email: "r@gmail.com", room_id: 2, provider: "google", user_type: "t"},
  {name: "Tammy", last_name: "Hershenbaum", email: "misshershi@gmail.com", room_id: 2, provider: "google", user_type: "t"},
  {name: "Jane", last_name: "Miller", email: "misstamar@gmail.com", provider: "google", user_type: "p"}
]

seed_parent = [
  {name: "Jane and Lora", last_name: "Miller", email: "misstamar@gmail.com", phone_number1: "425-247-5902"}
]

parent = Parent.create(seed_parent[0])


seed_children = [
  {name: "Yoav", last_name: "Mor", attend: true, gender: "boy", room_id: 2, parent1_number: "425-247-5902",
  parent2_number: "425-247-5901", medications_sensitivity: "Advil", city: "Seattle",
  address: "12918 133rd pl NE", dob: 4/3/2012, parents_names: "Tammy and Guy", email: "misshershi@gmail.com"},
  {name: "Daniel", last_name: "Andy", attend: true, gender: "girl", room_id: 2, parent1_number: "425-247-5902",
  parent2_number: "425-247-5901", medications_sensitivity: "Tylanol", city: "Bellevue",
  address: "12918 133rd pl NE", dob: 5/6/2014, parents_names: "Boris and Brandon", email: "misshershi@gmail.com"},
  {name: "Ori", last_name: "Dowl", attend: true, gender: "girl", room_id: 2, parent1_number: "425-247-5902",
  parent2_number: "425-247-5901", medications_sensitivity: "", city: "Kirkland",
  address: "12918 133rd pl NE", dob: 8/14/2013, parents_names: "Boris and Brandon", email: "misshershi@gmail.com"},
  {name: "Emily",last_name: "Mor", gender: "girl", room_id: 2, parent1_number: "425-247-5902", parent_id: parent.id,
  parent2_number: "425-247-5901", medications_sensitivity: "none", city: "Woodinvlle",
  address: "12918 133rd pl NE", dob: 9/4/2012, parents_names: "Tammy and Guy", email: "misshershi@gmail.com"},
  {name: "Tom",last_name: "Mor", gender: "boy", room_id: 2, parent1_number: "425-247-5902",parent_id: parent.id,
  parent2_number: "425-247-5901", medications_sensitivity: "none", city: "Woodinvlle",
  address: "12918 133rd pl NE", dob: 9/4/2012, parents_names: "Tammy and Guy", email: "misshershi@gmail.com"}
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

children = Child.all

children.each do |child|
  Info.create(:child_id => child.id)
end

seed_users.each do |teacher|
  User.create(teacher)
end
