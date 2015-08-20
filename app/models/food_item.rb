class FoodItem
  attr_accessor :id, :name, :nutrients
  def initialize(id, name, nutrients)
    @id = id
    @name = name
    @nutrients = nutrients
  end
end
