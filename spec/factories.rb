FactoryGirl.define do


  factory :google_user, class: User do
    name "George"
    provider "google"
    email "test@test.com"
  end

end
