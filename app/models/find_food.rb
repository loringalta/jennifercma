require "net/https"
require "uri"
require 'json'
require 'pp'
class FindFood < ActiveRecord::Base
  serialize :nutrients
  @@api = "mLGtkAwgswBDghnwNP6nxQEsu0gXYBOGAp1WBhWn"

  def self.get_usda_food_no(search_query)
    no_list = []
    usda = "http://api.nal.usda.gov/ndb/search/?format=json&q=#{search_query}&sort=r&max=5&offset=0&api_key=#{@@api}"
    response = Unirest.get usda
    return "no_match" unless response.code != 404
    response.body["list"]["item"].each do |item|
      no_list << item["ndbno"]
    end
    get_usda_food_info(no_list)
  end

  def self.get_usda_food_info(no_list)
    response = nil
    food_list = []
    no_list.each do |item_id|
      usda = "http://api.nal.usda.gov/ndb/reports/?ndbno=#{item_id}&type=b&format=json&api_key=#{@@api}"
      response = Unirest.get usda
      food_list << response.body["report"]["food"]
    end
    food_list
  end

  def self.json_parse_result(search_query)
    obj_array = []
    food_list = get_usda_food_no(search_query)
    if food_list.is_a? String
      obj_array = ["no results"]
    else
      food_list.each do |item|
        new_food = FoodItem.new
        food_nutrients = new_food.parse_nutrients(item["nutrients"])
        new_food.id = item["ndbno"]
        new_food.name = item["name"]
        new_food.nutrients = food_nutrients
        obj_array << new_food
      end
    end
    obj_array
  end
end
