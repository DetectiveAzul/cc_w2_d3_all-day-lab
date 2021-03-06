require 'minitest/autorun'
require 'minitest/rg'
require_relative '../customer'
require_relative '../pub'
require_relative '../drink'
require_relative '../food'

class CustomerTest < Minitest::Test
  def setup
    @jaime = Customer.new("Jaime", 29, 15)
    @aileen = Customer.new("Aileen", 26, 10)
    @sev = Customer.new("Sev", 17, 4)

    vodka = Drink.new("Absolut Vodka", 4, 2.5, 5)
    tennent = Drink.new("Tennent's", 3, 1, 10)
    gin = Drink.new("Hendrik's", 5, 2.5, 1)

    burguer = Food.new("Burguer", 10, 5)

    drink_array = [vodka, tennent, gin]
    food_array = [burguer]

    @malones = Pub.new("Malone's", 5, drink_array, food_array, 0)
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

  def test_getting_drunk
    @jaime.buy(@malones, "Absolut Vodka")
    @jaime.buy(@malones, "Absolut Vodka")
    assert_equal(5.0, @jaime.drunkeness)
  end

  def test_buying_drinks_being_under_18
    @sev.buy(@malones, "Absolut Vodka")
    assert_equal(4, @sev.wallet)
  end

  def test_buying_drinks_being_over_drunk_tolerance_level
    @jaime.buy(@malones, "Absolut Vodka")
    @jaime.buy(@malones, "Absolut Vodka")
    @jaime.buy(@malones, "Absolut Vodka")
    assert_equal(7, @jaime.wallet)
  end

  def test_buying_drinks_not_enough_stock
    @jaime.buy(@malones, "Hendrik's")
    @jaime.buy(@malones, "Hendrik's")
    assert_equal(10, @jaime.wallet)
  end

  def test_buying_food
    @jaime.buy_food(@malones,"Burguer")
    assert_equal(5, @jaime.wallet)
    assert_equal(10, @malones.till)
  end

  def test_buying_food__not_found
    @jaime.buy_food(@malones,"Burrito")
    assert_equal(15, @jaime.wallet)
    assert_equal(0, @malones.till)
  end

  def test_buying_food__not_enough_money
    @sev.buy_food(@malones,"Burguer")
    assert_equal(4, @sev.wallet)
    assert_equal(0, @malones.till)
  end

  def test_drunkness_rejuvenation
    @jaime.buy(@malones,"Absolut Vodka")
    assert_equal(2.5, @jaime.drunkeness)
    @jaime.buy_food(@malones, "Burguer")
    assert_equal(0, @jaime.drunkeness)
  end
end
