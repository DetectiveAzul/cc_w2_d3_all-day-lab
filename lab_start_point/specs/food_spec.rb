require 'minitest/autorun'
require 'minitest/rg'
require_relative '../food'

class FoodTest < Minitest::Test
  def setup
    @burguer = Food.new("BBQ Burguer", 10, 5)
  end

  def test_getters
    assert_equal("BBQ Burguer", @burguer.name)
    assert_equal(5, @burguer.rejuvenation_level)
    assert_equal(10, @burguer.price)
  end
end
