class Pub
  attr_reader :name, :drinks
  attr_accessor :till
  def initialize(name, drinks=[], till=0)
    @name = name
    @drinks = drinks
    @till = till
  end

  # def has_drink?(drink_name)
  #   for drink in @drinks
  #     return true if drink_name == drink.name
  #   end
  # end

  def get_drink_by_name(drink_name)
    for drink in @drinks
      return drink if drink.name == drink_name
    end
  end

  def add_money(drink_price)
    @till += drink_price
  end

end
