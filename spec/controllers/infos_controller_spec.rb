require 'rails_helper'

  RSpec.describe InfosController, type: :controller do
    let (:info) { create(:info) }
    let (:child) { create(:child) }
    let(:user) { User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:google]) }

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


end
