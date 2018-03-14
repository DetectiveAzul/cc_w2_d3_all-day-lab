class Pub
  attr_reader :name, :drinks
  attr_accessor :till
  def initialize(name, drinks=[], till=0)
    @name = name
    @drinks = drinks
    @till = till
  end
end
