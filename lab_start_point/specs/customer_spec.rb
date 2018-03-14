require 'minitest/autorun'
require 'minitest/rg'
require_relative '../customer'
require_relative '../pub'
require_relative '../drink'

class CustomerTest < Minitest::Test
  def setup
    @jaime = Customer.new("Jaime", 29, 15)
    @aileen = Customer.new("Aileen", 26, 10)
    @sev = Customer.new("Sev", 17, 4)

    vodka = Drink.new("Absolut Vodka", 4)
    tennent = Drink.new("Tennent's", 3)
    gin = Drink.new("Hendrik's", 5)

    drink_array = [vodka, tennent, gin]

    @malones = Pub.new("Malone's", drink_array, 0)
  end

  def test_getters
    assert_equal("Jaime", @jaime.name)
    assert_equal(17, @sev.age)
    assert_equal(10, @aileen.wallet)
  end

  def test_setters
    @sev.wallet -= 4
    assert_equal(0, @sev.wallet)
  end

  def test_pay_price
    @sev.pay(4)
    assert_equal(0, @sev.wallet)
  end

  def test_buy
    @jaime.buy(@malones, "Absolut Vodka")
    assert_equal(11,@jaime.wallet)
    assert_equal(4, @malones.till)
  end
end
