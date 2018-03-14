require 'minitest/autorun'
require 'minitest/rg'
require_relative '../pub'
require_relative '../drink'


class PubTest < Minitest::Test
  def setup
    vodka = Drink.new("Absolut Vodka", 4, 2.5)
    tennent = Drink.new("Tennent's", 3, 1.0)
    gin = Drink.new("Hendrik's", 5, 2.5)

    drink_array = [vodka, tennent, gin]

    @malones = Pub.new("Malone's",5, drink_array, 0)
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
end
