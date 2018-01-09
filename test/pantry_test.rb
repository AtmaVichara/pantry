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

  def test_it_adds_to_stock
    pantry = Pantry.new
    pantry.add_stock("Cheese", 20)

    assert_equal {"Cheese" => 20}, pantry.stock
  end

  # def test_stock_check_checks_for_contents
  #   pantry = Pantry.new
  #
  #
  # end

end
