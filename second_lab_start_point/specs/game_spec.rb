require 'minitest/autorun'
require 'minitest/rg'
require_relative '../game'
require_relative '../player'
require_relative '../hiddenWord'

class GameTest < Minitest::Test
  def setup
    player = Player.new("Jaime", 6)
    hidden_word = HiddenWord.new("codeclan")
    @game = Game.new(player,hidden_word)
  end

  def test_getters
    assert_equal("Jaime",@game.player.name)
    assert_equal("codeclan",@game.hidden_word.word)
    assert_equal([],@game.guessed_letters)
  end

  def test_setters
    @game.guessed_letters << "a"
    assert_equal("a",@game.guessed_letters.last)
  end

  def test_make_a_guessing
    @game.make_a_guessing("a")
    assert_equal(1,@game.guessed_letters.count)
    assert_equal("******a*",@game.hidden_word.display(@game.guessed_letters))
  end

  def test_is_lost
    6.times { @game.player.lose_life }
    assert_equal(true, @game.is_lost?())
  end

  def test_is_lost__return_false
    3.times { @game.player.lose_life }
    assert_equal(false, @game.is_lost?())
  end

  def test_is_won
  @game.guessed_letters = "codeclan".split('').sort
  assert_equal(true,@game.is_won?())
  end

  def test_is_won_returns_false
  assert_equal(false,@game.is_won?())
  end
end
