class Pantry

  attr_reader :stock, :shopping_list

  def initialize
    @stock = {}
    @shopping_list = {}
  end

  def restock(food, quantity)
    if stock.key?(food)
      @stock[food] += quantity
    else
      @stock.merge!({food => quantity})
    end
  end

  def stock_check(food)
    stock.key?(food) ? stock[food] : 0
  end

  def add_to_shopping_list(recipe)
    recipe.ingredients.each do |ingredient, quantity|
      @shopping_list.merge!({ingredient => quantity})
    end 
  end

end
