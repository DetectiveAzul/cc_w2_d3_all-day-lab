require 'minitest/autorun'
require 'minitest/rg'
require_relative '../drink'

class DrinkTest < Minitest::Test
  def setup
    @vodka = Drink.new("Absolut Vodka", 4, 2.5, 5)
    @tennent = Drink.new("Tennent's", 3, 1, 10)
    @gin = Drink.new("Hendrik's", 5, 2.5, 1)
  end

  def test_getters()
    assert_equal("Absolut Vodka", @vodka.name)
    assert_equal(5, @gin.price)
  end

  def test_add_stock
    @gin.add_stock(2)
    assert_equal(3, @gin.stock_amount)
  end

  def test_remove_stock
    @gin.remove_stock(1)
    assert_equal(0, @gin.stock_amount)
  end

end
