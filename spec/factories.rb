FactoryGirl.define do


  factory :google_user, class: User do
    name "George"
    provider "google"
    email "test@test.com"
  end

  factory :child, class: Child do
    name "Ada"
    last_name "Lovelace"
    parents_names "Jone and Marry"
    gender "girl"
    email "ada@gmail.com"
    attend true
  end

  factory :info, class: Info do
    child_id 1
    diaper_m "dry"
    diaper_a "bm"
    diaper_n "wet"
    lunch "none"
    more_wipes true
  end
end
