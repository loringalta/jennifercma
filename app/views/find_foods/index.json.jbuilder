json.array!(@find_foods) do |find_food|
  json.extract! find_food, :id, :name, :food_id, :nutrients
  json.url find_food_url(find_food, format: :json)
end
