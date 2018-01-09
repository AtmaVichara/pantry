require './lib/pantry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PantryTest < Minitest::Test

  def test_it_exists
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_it_has_attributes
    pantry = Pantry.new

    assert_equal Hash.new, pantry.stock
    assert_instance_of Hash, pantry.stock
    assert_equal Hash.new, pantry.shopping_list
  end

  def test_stock_check_returns_0_if_key_is_nil
    pantry = Pantry.new

    assert_equal 0, pantry.stock_check("Cheese")
  end

  def test_it_restocks
    pantry = Pantry.new
    pantry.restock("Cheese", 20)

    assert 20, pantry.stock_check("Cheese")

    pantry.restock("Cheese", 10)

    assert_equal 30, pantry.stock_check("Cheese")
  end

  def test_it_adds_to_shopping_list
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    pantry.add_to_shopping_list(r)

    assert_equal r.ingredients, pantry.shopping_list

    r = Recipe.new("Spaghetti")
    r.add_ingredient("Spaghetti Noodles", 10)
    r.add_ingredient("Marinara Sauce", 10)
    r.add_ingredient("Cheese", 5)
    pantry.add_to_shopping_list(r)

    ingredients = {"Cheese" => 25,
                   "Flour" => 20,
                   "Spaghetti Noodles" => 10,
                   "Marinara Sauce" => 10
                  }

    assert_equal ingredients, pantry.shopping_list
  end

  def test_it_prints_shopping_list
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    pantry.add_to_shopping_list(r)

    l = Recipe.new("Spaghetti")
    l.add_ingredient("Spaghetti Noodles", 10)
    l.add_ingredient("Marinara Sauce", 10)
    l.add_ingredient("Cheese", 5)
    pantry.add_to_shopping_list(l)

    list = "* Cheese: 25\n* Flour: 20\n* Spaghetti Noodles: 10\n* Marinara Sauce: 10"

    assert_equal list, pantry.print_shopping_list
  end
end
