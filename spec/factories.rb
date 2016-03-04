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

end
