class HiddenWord
  attr_reader :word
  attr_accessor :correct_letters
  def initialize(word)
    @word = word
    @correct_letters = []
  end

  def is_letter_correct?(guessed_letter)
    if @word.include?(guessed_letter)
      return true
    end
    return false
  end

  def display(guessed_letter)
    display_array = []
    word.split('').each do |letter|
      !guessed_letter.include?(letter) ? display_array.push("*")
        : display_array.push(letter)
    end
    return display_array.join()
  end
end
