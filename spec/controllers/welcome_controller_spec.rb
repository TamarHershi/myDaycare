require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "GET health" do
    it "render empty json" do
      get :health , format: :json
      expect(response).to render_nothings
    end
  end
end
