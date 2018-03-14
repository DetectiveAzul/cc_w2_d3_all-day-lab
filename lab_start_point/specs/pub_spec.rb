require 'minitest/autorun'
require 'minitest/rg'
require_relative '../pub'
require_relative '../drink'
require_relative '../customer'
require_relative '../food'


class PubTest < Minitest::Test
  def setup
    vodka = Drink.new("Absolut Vodka", 4, 2.5, 5)
    tennent = Drink.new("Tennent's", 3, 1, 10)
    gin = Drink.new("Hendrik's", 5, 2.5, 1)

    burguer = Food.new("Burguer", 10, 5)

    drink_array = [vodka, tennent, gin]
    food_array = [burguer]

    @malones = Pub.new("Malone's",5, drink_array, food_array, 0)
    @jaime = Customer.new("Jaime", 29, 15)
    @sev = Customer.new("Sev", 17, 4)
  end

  def test_getters
    assert_equal("Malone's", @malones.name)
    assert_equal(3, @malones.drinks.count)
  end

  def test_setters
    @malones.till += 100
    assert_equal(100, @malones.till)
  end

  # def test_has_drink__return_true
  #   assert_equal(true, @malones.has_drink?("Absolut Vodka"))
  # end
  #
  # def test_has_drink__return_false
  #   assert_equal(true, @malones.has_drink?("Absolut Vodka"))
  # end

  def test_get_drink_by_name
    drink = @malones.get_drink_by_name("Absolut Vodka")
    assert_equal(@malones.drinks.first, drink)
  end

  def test_add_money
    @malones.add_money(4)
    assert_equal(4, @malones.till)
  end

  def test_check_for_age__returns_true
    assert_equal(true,@malones.check_for_age?(@jaime))
  end

  def test_check_for_age__returns_false
    assert_equal(false,@malones.check_for_age?(@sev))
  end

  def test_check_drunkeness__returns_true
    @jaime.buy(@malones, "Absolut Vodka")
    @jaime.buy(@malones, "Absolut Vodka")
    assert_equal(true,@malones.check_for_drunkeness?(@jaime))
  end

  def test_check_drunkeness__returns_false
    assert_equal(false,@malones.check_for_drunkeness?(@sev))
  end

  def test_enough_drink__returns_true
    assert_equal(true,@malones.enough_drinks?(@malones.drinks.first))
  end

  def test_enough_drink__returns_false
    @malones.drinks.last.remove_stock(1)
    assert_equal(false,@malones.enough_drinks?(@malones.drinks.last))
  end

  def test_get_stock_of_a_drink
    result = @malones.get_stock_of_drink("Hendrik's")
    assert_equal(1, result)
  end

  def test_get_stock_of_all_drinks
    result = @malones.get_stock_of_all_drinks
    assert_equal(16, result)
  end

  def test_get_food_by_name
    assert_equal(@malones.foods.first,@malones.get_food_by_name("Burguer"))
  end

  def test_get_food_by_name__nil
    assert_nil(@malones.get_food_by_name("Burritos"))
  end
end
