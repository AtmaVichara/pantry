class Pantry

  attr_reader :stock

  def initialize
    @stock = {}
  end

  def add_stock(food, quantity)
    @stock.merge!({food => quantity})
  end

  def stock_check(food)
    stock[food] if stock.key?(food)
  end
end
