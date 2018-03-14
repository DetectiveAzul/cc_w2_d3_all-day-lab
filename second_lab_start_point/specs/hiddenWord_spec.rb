require 'minitest/autorun'
require 'minitest/rg'
require_relative '../hiddenWord'

class HiddenWordTest < Minitest::Test
  def setup
    @hidden_word = HiddenWord.new("codeclan")
  end

  def test_getters
    assert_equal("codeclan",@hidden_word.word)
  end

end
