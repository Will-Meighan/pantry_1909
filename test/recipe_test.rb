require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ingredient.rb'
require_relative '../lib/recipe.rb'

class RecipeTest < Minitest::Test

  def setup
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)

    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_it_has_attributes
    assert_equal "Mac and Cheese", @mac_and_cheese.name

    hash = {}
    assert_equal hash, @mac_and_cheese.ingredients_required
  end

  def add_ingredient
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    hash = {@cheese => 2, @mac => 8}
    assert_equal hash, @mac_and_cheese.ingredients_required
  end

  def test_it_can_calculate_amount_required
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    assert_equal 2, @mac_and_cheese.amount_required(@cheese)
    assert_equal 8, @mac_and_cheese.amount_required(@mac)
  end

  def test_it_can_find_ingredients
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    assert_equal [@cheese, @mac], @mac_and_cheese.ingredients
  end

  def test_it_can_calculate_total_calories
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    assert_equal 440, @mac_and_cheese.total_calories
  end

end
