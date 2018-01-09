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
  end

  def test_stock_check_returns_0_if_key_is_nil
    pantry = Pantry.new
    pantry.restock("Cheese", 20)

    assert_equal 0, pantry.stock_check("Cheese")
  end

  # def test_it_restocks
  #   pantry = Pantry.new
  #   pantry.add_stock("Cheese", 10)
  #   pantry.restock("Cheese", 20)
  #
  #
  # end

end
