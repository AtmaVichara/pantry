class Pantry

  attr_reader :stock

  def initialize
    @stock = {}
  end

  def restock(food, quantity)
    @stock.merge!({food => quantity}) if stock.key?(food)
  end

  def stock_check(food)
    stock.key?(food) ? stock[food] : 0
  end


end
