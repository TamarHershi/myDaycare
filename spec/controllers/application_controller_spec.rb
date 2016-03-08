require 'rails_helper'
require 'pry'
RSpec.describe ApplicationController, type: :controller do

 let(:user) { User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:google]) }

  before :each do
    session[:user_id] = user.id
  end
  describe "current user" do
    it "sets @current_user to logged in user" do
      expect(assigns(:current_user).id).to eq(session[:user_id])
    end
  end
end
