require 'rails_helper'

RSpec.describe ChildrenController, type: :controller do

  let (:child) { create(:child) }
  let(:user) { User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:google]) }

  before :each do
    session[:user_id] = user.id
  end

  describe "GET index" do
    context "it is succeful" do
      it "renders children index page" do
      get :index
      expect(response).to render_template :index
      end
    end
  end
#
#   describe "GET #index" do
#   it "returns http success" do
#     get :index
#     expect(response).to have_http_status(:success)
#   end
# end


end
