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
          # let(:first_child) {
          # {  name: "first",
          #   last_name: "first",
          #   email: "first@gmail.com",
          #   attend: true,
          #   room_id: 5 }
          # }
          # let(:second_child) {
          # { name: "seconde",
          #   last_name: "second",
          #   attend: true,
          #   email: "first@gmail.com",
          #   room_id: 5 }
          # }
          # let(:new_info) {
          # { diaper_m: "wet",
          #   child_id: seconde_child.id,
          #   created_at: "2016-03-03T16:29:30-08:00 ((2457453j,1770s,655923000n),-28800s,2299161j)"}
          # }
          # let(:room) {
          #   {id: 5}
          # }

          context "When it is a new day" do
            it "Makes all children be as not attend" do
              # binding.pry
              post :new_forms
              expect(first_child.attend).to equal false
            end

            it "redirect to welcome path with the right notice"
            it "created new empty forms for all the children"
          end
          context "When it is the same day" do
            it "redirect to welcome path with right notice"
            it "will not create new forms"
          end

      end



end
