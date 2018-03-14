class Game
  attr_reader :player, :hidden_word
  attr_accessor :guessed_letters
  def initialize(player, hidden_word)
    @player = player
    @hidden_word = hidden_word
    @guessed_letters = []
  end

  def make_a_guessing(letter)
    @guessed_letters << letter
    if letter.length < 2 && letter.length > 0
      p "Indeed, letter '#{letter}' is on the secret word" if
          @hidden_word.is_letter_correct?(letter)
      p "Oh-oh, '#{letter}' is not here!" if
          @hidden_word.is_letter_correct?(letter) == false
    else
      p "'#{letter}' is not a valid option, friend!"
    end
  end

  def is_won?()
    array_to_check = @hidden_word.word.split('').sort
    return true if @guessed_letters.sort == array_to_check
    return false
  end

  def is_lost?()
    return true if @player.lives <= 0
    return false
  end
end
