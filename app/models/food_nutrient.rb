class FoodNutrient
  attr_accessor :name, :unit, :value
  def initialize(name, unit, value)
    @name = name
    @unit = unit
    @value = value
  end
end
