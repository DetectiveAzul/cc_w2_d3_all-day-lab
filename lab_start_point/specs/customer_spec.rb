require 'minitest/autorun'
require 'minitest/rg'
require_relative '../customer'

class CustomerTest < Minitest::Test
  def setup
    @jaime = Customer.new("Jaime", 29, 15)
    @aileen = Customer.new("Aileen", 26, 10)
    @sev = Customer.new("Sev", 17, 4)
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
end
