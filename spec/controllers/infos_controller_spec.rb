require 'rails_helper'

  RSpec.describe InfosController, type: :controller do
    let (:info) { create(:info) }
    let (:child) { create(:child) }
    let (:room) {create(:room)}
    let (:user) {
      User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:google])  do |user|
       user.room_id = room.id
     end
   }

    before :each do
      session[:user_id] = user.id
    end

    describe "PATCH 'update'" do
      let (:info_params) {
        { child_id: child.id,
          diaper_m: "dry",
          breakfast: "none"
        }
      }
      let (:info_bad_params) {
        { child_id: nil,
          name: "",
          last_name: "",
          email: "example@gmail.com"
        }
      }
      context "it has information" do
        it "redirect to the my_class page" do
          patch :update, :info => info_params , :user_id => user.id, :child_id => child.id, :id => info.id
          expect(subject).to redirect_to my_class_path(user.id)
        end
      end
    end

    describe "GET 'edit'" do
      it "renders edit page" do
        get :edit, :user_id => user.id, :child_id => child.id, :id => info.id
        expect(subject).to render_template :edit
      end
    end

#############

    describe "POST 'new_forms'" do

      context "When it is a new day" do
        it "Makes all children be as not attend" do
          child_one = Child.create(name: "child", last_name: "one", email: "child@gmail.com", attend: true, room_id: room.id)
          child_two = Child.create(name: "child_two", last_name: "two", email: "two@Gmail.com", attend: true, room_id: room.id)
          date = DateTime.new(2014,2,3)
          info = Info.create(child_id: child_one.id, created_at: date)
          info_two = Info.create(child_id: child_two.id, created_at: date)
          # binding.pry
          post :new_forms
          expect(child_one.reload.attend).to equal false
        end
        it " redirect to welcome page with the right notice" do
          child_one = Child.create(name: "child", last_name: "one", email: "child@gmail.com", attend: true, room_id: room.id)
          child_two = Child.create(name: "child_two", last_name: "two", email: "two@Gmail.com", attend: true, room_id: room.id)
          date = DateTime.new(2014,2,3)
          info = Info.create(child_id: child_one.id, created_at: date)
          info_two = Info.create(child_id: child_two.id, created_at: date)
          post :new_forms
          expect(flash[:notice]).to include "Good morning #{user.name}"
          expect(response).to redirect_to root_path
        end
      end

    end



  end
