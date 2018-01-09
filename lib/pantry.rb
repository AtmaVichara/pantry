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

end
