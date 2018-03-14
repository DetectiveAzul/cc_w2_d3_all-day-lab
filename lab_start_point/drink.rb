class Drink
  attr_reader :name, :price, :alcohol_level, :stock_amount
  def initialize(name, price, alcohol_level)
    @name = name
    @price = price
    @alcohol_level = alcohol_level
    @stock_amount = stock_amount
  end
end
