require "net/https"
require "uri"

class StaticPagesController < ApplicationController
  def get_foods
    response = Unirest.get "https://nutritionix-api.p.mashape.com/v1_1/search/cheddar%20cheese?fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_total_fat",
    headers:{
      "X-Mashape-Key" => "lRBK5zHzYImshNpowCOGO1OrE5Ufp1dOamBjsnpxcrfdrn786D",
      "Accept" => "application/json"
    }
    response.body
  end

  def home
    @food = get_foods
  end

  def food
    @food = get_foods
  end
end
