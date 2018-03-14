class Player
  attr_reader :name
  attr_accessor :lives
  def initialize(name, lives=6)
    @name = name
    @lives = lives
  end

  def lose_life()
    @lives -= 1
  end
end
