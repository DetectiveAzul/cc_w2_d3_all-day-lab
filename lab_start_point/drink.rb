class Drink
  attr_reader :name, :price, :alcohol_level, :stock_amount
  def initialize(name, price, alcohol_level, stock_amount)
    @name = name
    @price = price
    @alcohol_level = alcohol_level
    @stock_amount = stock_amount
  end

  def add_stock(amount)
    @stock_amount += amount
  end

  def remove_stock(amount)
    @stock_amount -= amount
  end
end
