require 'rails_helper'
require 'pry'

# RSpec.describe ApplicationController, type: :controller do
#
#   describe "current user" do
#     before :each do
#       request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google]
#       user = User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:google])
#       session[:user_id] = user.id
#     end
#     it "sets @current_user to logged in user" do
#       binding.pry
#       expect(assigns(:current_user).id).to eq(session[:user_id])
#     end
#   end
# end
