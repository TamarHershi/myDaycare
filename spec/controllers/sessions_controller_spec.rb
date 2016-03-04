require 'rails_helper'

  RSpec.describe SessionsController, type: :controller  do
    describe "GET #create" do
      context "when using github authorization" do
        context "is successful" do
          before { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google] }

          it "redirects to home page" do
            get :create, provider: :google
            expect(response).to redirect_to root_path
          end

          it "creates a user" do
            expect { get :create, provider: :google }.to change(User, :count).by(1)
          end
          it "assigns the @user var" do
            get :create, provider: :google
            expect(assigns(:user)).to be_an_instance_of(User)
          end

          it "assigns the session[:user_id]" do
            get :create, provider: :google
            expect(session[:user_id]).to eq assigns(:user).id
          end

        end
      end
    end
  end
