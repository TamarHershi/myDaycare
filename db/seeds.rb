# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Charge.delete_all
Room.delete_all
Info.delete_all
Parent.delete_all
Child.delete_all

seed_users = [
  {name: "Tammy", last_name: "Hershenbaum", email: "misshershi@gmail.com", room_id: 2, provider: "google", user_type: "t"},
  {name: "Jane", last_name: "Miller", email: "misstamar@gmail.com", provider: "google", user_type: "p"}
]

seed_parent = [
  {name: "Jane and Lora", last_name: "Miller", email: "misstamar@gmail.com", phone_number1: "425-247-5902"},
  {name: "Michael and David", last_name: "Donger", email: "f@gmail.com", phone_number1: "425-247-5902", phone_number2: "425-247-5901"}
]

parent = Parent.create(seed_parent[0])
parent2 = Parent.create(seed_parent[1])


seed_children = [
  {name: "Yoav", last_name: "Mor", attend: true, gender: "boy", room_id: 2, parent1_number: "425-247-5902", parent_id: parent2.id,
  parent2_number: "425-247-5901", medications_sensitivity: "Advil", city: "Seattle", tuition: 1450,
  address: "12918 133rd pl NE", dob: 4/3/2012, parents_names: "Tammy and Guy", email: "misshershi@gmail.com"},
  {name: "Daniel", last_name: "Andy", attend: true, gender: "girl", room_id: 2, parent1_number: "425-247-5902", parent_id: parent2.id,
  parent2_number: "425-247-5901", medications_sensitivity: "Tylanol", city: "Bellevue", tuition: 1450,
  address: "12918 133rd pl NE", dob: 5/6/2014, parents_names: "Boris and Brandon", email: "misshershi@gmail.com"},
  {name: "Ori", last_name: "Dowl", attend: true, gender: "girl", room_id: 2, parent1_number: "425-247-5902", parent_id: parent2.id,
  parent2_number: "425-247-5901", medications_sensitivity: "", city: "Kirkland", tuition: 1450,
  address: "12918 133rd pl NE", dob: 8/14/2013, parents_names: "Boris and Brandon", email: "misshershi@gmail.com"},
  {name: "Emily",last_name: "Mor", gender: "girl", room_id: 1, parent1_number: "425-247-5902", parent_id: parent.id,
  parent2_number: "425-247-5901", medications_sensitivity: "none", city: "Woodinvlle", tuition: 1450,
  address: "12918 133rd pl NE", dob: 9/4/2012, parents_names: "Tammy and Guy", email: "misshershi@gmail.com"},
  {name: "Tom",last_name: "Mor", gender: "boy", room_id: 2, parent1_number: "425-247-5902",parent_id: parent.id,
  parent2_number: "425-247-5901", medications_sensitivity: "none", city: "Woodinvlle", tuition: 1450,
  address: "12918 133rd pl NE", dob: 9/4/2012, parents_names: "Tammy and Guy", email: "misshershi@gmail.com"}
]
date = DateTime.new(2016,3,17)
date2 = DateTime.new(2016,3,16)
date3 = DateTime.new(2016,3,15)
date4 = DateTime.new(2016,3,14)
date5 = DateTime.new(2016,3,13)
date6 = DateTime.new(2016,3,13)
date7 = DateTime.new(2016,2,13)
date8 = DateTime.new(2016,1,13)

seed_charges_1 = [
          {date: date6.strftime('%Y-%m'), authenticity_token: "dsfkljasdlk3453j6nk", stripeToken: "dsfsdg3w45tesdf", payed: true, amount: 125000 },
          {date: date7.strftime('%Y-%m'), authenticity_token: "dsfkljasdlk3453j6nk", stripeToken: "dsfsdg3w45tesdf", payed: true, amount: 125000 },
          {date: date8.strftime('%Y-%m'), authenticity_token: "dsfkljasdlk3453j6nk", stripeToken: "dsfsdg3w45tesdf", payed: true, amount: 125000 }
            ]

seed_charges_2 = [
          {date: date6.strftime('%Y-%m'), authenticity_token: "dsfkljasdlk3453j6nk", stripeToken: "dsfsdg3w45tesdf", payed: true, amount: 125000 },
          {date: date7.strftime('%Y-%m'), authenticity_token: "dsfkljasdlk3453j6nk", stripeToken: "dsfsdg3w45tesdf", payed: true, amount: 125000 },
          {date: date8.strftime('%Y-%m'), authenticity_token: "dsfkljasdlk3453j6nk", stripeToken: "dsfsdg3w45tesdf", payed: true, amount: 125000 }
              ]

seed_infos = [
          {diaper_m: "dry", diaper_n: "dry", diaper_a: "bm", breakfast: "none", lunch: "all", afternoon: "most", general: "We played hide and seek", sleep_time: "12-2:30", more_clothes: true, more_wipes: true, created_at: date },
          {diaper_m: "wet", diaper_n: "dry", diaper_a: "bm", breakfast: "most", lunch: "all", afternoon: "most", general: "We played outside today!", sleep_time: "12-1:00", more_clothes: true, more_daiper: true, created_at: date2},
          {diaper_m: "wet", diaper_n: "dry", diaper_a: "dry", breakfast: "most", lunch: "all", afternoon: "none", general: "They were so happy", sleep_time: "12-1:00", more_clothes: true, created_at: date3},
          {diaper_m: "wet", diaper_n: "dry", diaper_a: "bm", breakfast: "most", lunch: "all", afternoon: "most", general: "She was really happy", sleep_time: "12-1:00", more_daiper: true, more_wipes: true, created_at: date4},
          {diaper_m: "wet", diaper_n: "dry", diaper_a: "bm", breakfast: "most", lunch: "all", afternoon: "most", general: "He was fussy", sleep_time: "12-1:00", more_clothes: true, created_at: date5}
            ]

seed_children.each do |child|
  child = Child.create(child)
  if child.room_id == 1
    seed_charges_1.each do |charge|
      charge = Charge.create(charge)
      charge.child_id = child.id
      charge.save
    end
  elsif child.room_id == 2
    seed_charges_2.each do |charge|
      charge = Charge.create(charge)
      charge.child_id = child.id
      charge.save
    end
  end
  seed_infos.each do |info|
    info = Info.create(info)
    info.child_id = child.id
    info.save
  end
end

seed_rooms = [
  {name: "Rainbow", tuition: 125000},
  {name: "Sunshine", tuition: 145000}
]
seed_rooms.each do |room|
  Room.create(room)
end

seed_users.each do |teacher|
  User.create(teacher)
end
