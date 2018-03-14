class HiddenWord
  attr_reader :word
  attr_accessor :correct_letters
  def initialize(word)
    @word = word
    @correct_letters = []
  end

  def is_letter_correct?(guessed_letter)
    if @word.include?(guessed_letter)
      put_into_correct_letters_array(guessed_letter)
      return true
    end
    return false
  end

  def put_into_correct_letters_array(guessed_letter)
    @correct_letters << guessed_letter
  end

  def display
    display_array = []
    word.split('').each do |letter|
      !@correct_letters.include?(letter) ? display_array.push("*")
        : display_array.push(letter)
    end
    return display_array.join()
  end
end
