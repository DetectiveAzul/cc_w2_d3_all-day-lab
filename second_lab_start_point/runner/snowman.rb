require_relative '../game'
require_relative '../player'
require_relative '../hiddenword'

puts "Hello, comrade! You're testing the guessing skills of a fellow comrade"
puts "Please, input the secret word he will need to discover"
word = gets.chomp.downcase
puts "So the word you want him to discover is: '#{word}'"
puts "Let's get ready!"

hidden_word = HiddenWord.new(word)
player = Player.new("player01",6)
game = Game.new(player, hidden_word)
game.clear_screen

loop do

  puts "Your number of attempts left is: #{game.player.lives}"
  puts "Letters you guessed: #{game.guessed_letters}"
  puts "\n\n\n"
  puts game.hidden_word.display(game.guessed_letters)
  puts "\n\n\n"
  puts "Please, insert the letter you want to guess!"
  game.make_a_guessing(gets.chomp.downcase)
  if game.is_won?
    system "clear" or system "cls"
    p "YAY, you have saved the wee snowman. YOU'RE A SUPERSTAR"
    p "The secret word was.... '#{game.hidden_word.word}'"
    break
  end
  if game.is_lost?
    system "clear" or system "cls"
    p "Oooh, the snowman melted. You've LOST!"
    p "The secret word was.... '#{game.hidden_word.word}'"
    break
  end

  game.clear_screen

end
