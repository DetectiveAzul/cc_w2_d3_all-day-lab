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

  def test_display__no_letters
    guessed_letters = []
    assert_equal("********",@hidden_word.display(guessed_letters))
  end

  def test_display__some_correct_letters
    guessed_letters = ["o", "c"]
    assert_equal("co**c***",@hidden_word.display(guessed_letters))
  end

  def test_is_letter_correct__returns_true
    assert_equal(true,@hidden_word.is_letter_correct?("o"))
  end

  def test_is_letter_correct__returns_false
    assert_equal(false,@hidden_word.is_letter_correct?("k"))
  end
end
