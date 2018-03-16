require 'io/console'

class Game
  attr_reader :player, :hidden_word
  attr_accessor :guessed_letters
  def initialize(player, hidden_word)
    @player = player
    @hidden_word = hidden_word
    @guessed_letters = []
  end

  def make_a_guessing(letter)
    if letter.length < 2 && letter.length > 0
      if @guessed_letters.include?(letter)
        p "You've already said that letter, pal!"
      else
        @guessed_letters << letter
        p "Indeed, letter '#{letter}' is on the secret word" if
          @hidden_word.is_letter_correct?(letter)
        if @hidden_word.is_letter_correct?(letter) == false
          p "Oh-oh, '#{letter}' is not here!"
          @player.lose_life()
        end
      end
    else
      p "'#{letter}' is not a valid option, friend!"
    end
  end

  def is_won?()
    array_to_check = @hidden_word.word.split('').sort.uniq
    return true if @guessed_letters.sort == array_to_check
    return false
  end

  def is_lost?()
    return true if @player.lives <= 0
    return false
  end

  def clear_screen
    puts "\nPress Any Key To Continue"
    STDIN.getch
    system "clear" or system "cls"
  end
end
