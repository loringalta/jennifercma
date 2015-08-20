require "net/https"
require "uri"
require 'json'
require 'pp'
class FindFood < ActiveRecord::Base
  @@api = "nCvF2BktudcbF39ojuK0HZv97p0AGYbSTSyIBTfi"
  def self.get_foods(search_query)
    get_usda_food_no(search_query)
  end

  def self.get_usda_food_no(search_query)
    no_list = []
    pp search_query
    usda = "http://api.nal.usda.gov/ndb/search/?format=json&q=#{search_query}&sort=r&max=25&offset=0&api_key=#{@@api}"
    response = Unirest.get usda
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

  def self.parse_nutrients(nutrient)
    nutrient_ids = ["208", "203", "204", "205", "269"]
    food_nutrients = []
    nutrient.each do |item|
      if nutrient_ids.include? item["nutrient_id"]
        food_nutrients << FoodNutrient.new(item["name"], item["unit"], item["value"])
      end
    end
    food_nutrients
  end

  def self.json_parse_result(search_query)
    obj_array = []
    food_list = get_foods(search_query)
    food_list.each do |h|
      name = h["name"]
      food_nutrients = parse_nutrients(h["nutrients"])
      obj_array << FoodItem.new(h["ndbno"], name, food_nutrients)
    end
    obj_array
  end
end
