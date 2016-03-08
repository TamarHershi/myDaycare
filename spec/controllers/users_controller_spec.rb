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
      it "redirect to another controller" do
        child_one = Child.create(name: "child", last_name: "one", email: "child@gmail.com", attend: true, room_id: room.id)
        child_two = Child.create(name: "child_two", last_name: "two", email: "two@Gmail.com", attend: true, room_id: room.id)
        date = DateTime.new(2014,2,3)
        info = Info.create(child_id: child_one.id, created_at: date)
        info_two = Info.create(child_id: child_two.id, created_at: date)
        get :my_class, :id => user.id
        expect(response).to redirect_to new_forms_path
      end
    end
    context "When it's the same day" do
      it "will render my class page" do
        child_one = Child.create(name: "child", last_name: "one", email: "child@gmail.com", attend: true, room_id: room.id)
        child_two = Child.create(name: "child_two", last_name: "two", email: "two@Gmail.com", attend: true, room_id: room.id)
        date = DateTime.now
        info = Info.create(child_id: child_one.id, created_at: date)
        info_two = Info.create(child_id: child_two.id, created_at: date)
        get :my_class, :id => user.id
        expect(response).to render_template my_class_path
      end
    end
  end
end
