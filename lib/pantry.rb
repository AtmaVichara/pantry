class Pantry

  attr_reader :stock

  def initialize
    @stock = {}
  end

  def add_stock(stock, quantity)
    stock.merge!(stock => quantity)
  end

end
