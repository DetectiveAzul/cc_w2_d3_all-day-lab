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

end
