require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ingredient.rb'
require_relative '../lib/recipe.rb'
require_relative '../lib/pantry.rb'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new

    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)

    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_it_has_attributes
    hash = {}
    assert_equal hash, @pantry.stock
  end

  def test_stock_is_empty_initially
    assert_equal 0, @pantry.stock_check(@cheese)
  end

  def test_it_can_restock
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)

    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_it_has_enough_ingredients_for_recipe
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)

    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)

    @pantry.restock(@mac, 1)

    assert_equal true, @pantry.enough_ingredients_for?(@mac_and_cheese)
  end

end
