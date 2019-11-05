class Pantry

  attr_reader :stock

  def initialize
    @stock =  Hash.new(0)
    # @stock_check = 0
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    # Need to iterate over the ingredients required, within the recipe hash, to return a boolean determining if there are enough ingredients
    recipe.ingredients_required do |ingredient, amount|
    require "pry"; binding.pry
  end

end
