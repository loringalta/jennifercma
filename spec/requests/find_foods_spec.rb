require 'rails_helper'

RSpec.describe "FindFoods", type: :request do
  describe "GET /find_foods" do
    it "works! (now write some real specs)" do
      get find_foods_path
      expect(response).to have_http_status(200)
    end
  end
end
