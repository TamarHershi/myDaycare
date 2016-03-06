require 'rails_helper'

RSpec.describe User, type: :model do

  describe ".validations" do
    it "name must be present" do
      expect(Child.new(name: nil, email: "bla@gmail.com", last_name: "google")).to_not be_valid
    end
    it "email must be present" do
      expect(User.new(name: "Bob", email: nil, last_name: "google")).to_not be_valid
    end

    it "last name must be present" do
      expect(User.new(name: "Bob", email: "bla@gmail.com", last_name: nil)).to_not be_valid
    end

  end

  describe "can be instantiated" do
    it "exists" do
      expect(User.new).not_to be_nil
    end
  end

  describe "google oauth" do
    let(:user) { build(:google_user) }

    context "validations" do
      it "is valid" do
        expect(user).to be_valid
      end
    end
    it "requires a username" do
      user.name = nil
      expect(user).to be_invalid
    end

    it "requires a provider" do
      user.provider = nil
      expect(user).to be_invalid
    end
  end


  describe ".initialize_from_omniauth" do
    let(:user) { User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:google]) }

    it "creates a valid user" do
      expect(user).to be_valid
    end

    context "when it's invalid" do
      it "returns nil" do
        user = User.find_or_create_from_omniauth({"uid" => "123", provider: "twitter", "info" => {}})
        expect(user).to be_nil
      end
    end
  end

end
