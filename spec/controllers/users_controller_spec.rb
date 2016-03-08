require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  let (:room) {create(:room)}
  let (:user) {
    User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:google])  do |user|
     user.room_id = room.id
   end
  }

  before :each do
    session[:user_id] = user.id
  end

  describe "GET 'my_class'" do

    context "When it is a new day" do
      it "Makes all children be as not attend" do
        child_one = Child.create(name: "child", last_name: "one", email: "child@gmail.com", attend: true, room_id: room.id)
        child_two = Child.create(name: "child_two", last_name: "two", email: "two@Gmail.com", attend: true, room_id: room.id)
        date = DateTime.new(2014,2,3)
        info = Info.create(child_id: child_one.id, created_at: date)
        info_two = Info.create(child_id: child_two.id, created_at: date)
        get :my_class
        expect(child_one.reload.attend).to equal false
      end
end
