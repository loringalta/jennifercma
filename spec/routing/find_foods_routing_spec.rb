require "rails_helper"

RSpec.describe FindFoodsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/find_foods").to route_to("find_foods#index")
    end

    it "routes to #new" do
      expect(:get => "/find_foods/new").to route_to("find_foods#new")
    end

    it "routes to #show" do
      expect(:get => "/find_foods/1").to route_to("find_foods#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/find_foods/1/edit").to route_to("find_foods#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/find_foods").to route_to("find_foods#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/find_foods/1").to route_to("find_foods#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/find_foods/1").to route_to("find_foods#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/find_foods/1").to route_to("find_foods#destroy", :id => "1")
    end

  end
end
