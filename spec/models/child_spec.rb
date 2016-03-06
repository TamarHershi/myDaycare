require 'rails_helper'

RSpec.describe Child, type: :model do

    let! (:child) { create(:child) }
    let! (:new_child) { create(:child) }
    let (:room) {create(:room)}

    let (:user) {
      User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:google])  do |user|
       user.room_id = room.id
     end
   }

  describe ".validations" do
    it "name must be present" do
      expect(User.new(name: nil, email: "bla@gmail.com", provider: "google")).to_not be_valid
    end
    it "email must be present" do
      expect(User.new(name: "Bob", email: nil, provider: "google")).to_not be_valid
    end

    it "provider must be present" do
      expect(User.new(name: "Bob", email: "bla@gmail.com", provider: nil)).to_not be_valid
    end

  end

  describe "Child not attend methos" do
    it "update the attend to false" do
        child = Child.create(name: "child", last_name: "one", email: "child@gmail.com", attend: true)
        child_two = Child.create(name: "child_two", last_name: "two", email: "two@Gmail.com", attend: true)
        children = [child, child_two]
        Child.not_attend(children)
        expect(child.attend).to be_falsy
    end
  end

end
