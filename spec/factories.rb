FactoryGirl.define do
  factory :registration do
    
  end
  factory :parent do
    
  end

  factory :room, class: Room do
    name "Rainbow"
  end


  factory :google_user, class: User do
    name "George"
    provider "google"
    email "test@test.com"
    association :room, factory: :room
  end

  factory :child, class: Child do
    name "Ada"
    last_name "Lovelace"
    parents_names "Jone and Marry"
    gender "girl"
    email "ada@gmail.com"
    attend true
    association :room, factory: :room
  end

  factory :info, class: Info do
    child_id 1
    diaper_m "dry"
    diaper_a "bm"
    diaper_n "wet"
    lunch "none"
    more_wipes true
    association :child, factory: :child
  end

  factory :new_child, class: Child do
    name "first"
    last_name "first"
    email "first@gmail.com"
    attend true
    association :room, factory: :room
  end


end
