FactoryGirl.define do
  factory :food_nutrients do
    name "MyNutrient"
    unit "g"
    value "2"
  end

  factory :food_item do
    food_id 1
    name "Item1"
    group "MyGroup"
    nutrients :food_nutrients
  end

  factory :find_food do
    num_results 1
    name "MyString"
    food_id 1
    group "myGroup"
    nutrients :food_nutrients
  end

end
