require 'minitest/autorun'
require 'minitest/rg'
require_relative '../player'

class PlayerTest < Minitest::Test
  def setup
    @player = Player.new("Jaime", 6)
  end

  def test_getters
    assert_equal("Jaime", @player.name)
    assert_equal(6, @player.lives)
  end

  def test_setters
    @player.lose_life()
    assert_equal(5, @player.lives)
  end
    
end
