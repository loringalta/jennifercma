class FoodItem < ActiveRecord::Base
  serialize :nutrients

  def create_new_nutrient(item, food_nutrients)
    new_food          = FoodNutrient.new
    new_food.name     = item["name"]
    new_food.unit     = item["unit"]
    new_food.value    = item["value"]
    new_food.measures = item["measures"]
    food_nutrients << new_food
  end

  def parse_nutrients(nutrient)
    food_nutrients = []
    nutrient.each do |item|
      food_nutrients = create_new_nutrient(item, food_nutrients)
    end
    food_nutrients
  end
end
