class Pub
  attr_reader :name, :drinks
  attr_accessor :till, :tolerance_level
  def initialize(name, tolerance_level, drinks=[], till=0)
    @name = name
    @drinks = drinks
    @till = till
    @tolerance_level = tolerance_level
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

  def check_for_age?(customer)
    return customer.age >= 18
  end

  def check_for_drunkeness?(customer)
    return customer.drunkeness >= @tolerance_level
  end
end
