require 'minitest/autorun'
require 'minitest/rg'
require_relative '../drink'

class DrinkTest < Minitest::Test
  def setup
    @vodka = Drink.new("Absolut Vodka", 4)
    @tennent = Drink.new("Tennent's", 3)
    @gin = Drink.new("Hendrik's", 5)
  end

  def test_getters()
    assert_equal("Absolut Vodka", @vodka.name)
    assert_equal(5, @gin.price)
  end

end
