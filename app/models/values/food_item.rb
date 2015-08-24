class FoodItem < ActiveRecord::Base
  serialize :nutrients
  def parse_nutrients(nutrient)
    nutrient_ids   = ["208", "203", "204", "205", "269"]
    food_nutrients = []
    nutrient.each do |item|
      if nutrient_ids.include? item["nutrient_id"]
        new_food        = FoodNutrient.new
        new_food.name   = item["name"]
        new_food.unit   = item["unit"]
        new_food.value  = item["value"]
        food_nutrients << new_food
      end
    end
    food_nutrients
  end
end
