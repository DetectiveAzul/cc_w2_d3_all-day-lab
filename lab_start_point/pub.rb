class Pub
  attr_reader :name, :drinks, :foods
  attr_accessor :till, :tolerance_level
  def initialize(name, tolerance_level, drinks=[], foods=[], till=0)
    @name = name
    @drinks = drinks
    @foods = foods
    @till = till
    @tolerance_level = tolerance_level
  end

  def has_drink?(drink_name)
    for drink in @drinks
      return true if drink_name == drink.name
    end
    return nil
  end

  def get_drink_by_name(drink_name)
    for drink in @drinks
      return drink if drink.name == drink_name
    end
    return nil
  end

  def get_food_by_name(food_name)
    for food in @foods
      return food if food.name == food_name
    end
    return nil
  end

  def add_money(drink_price)
    @till += drink_price
  end

  def check_for_age?(customer)
    return true if customer.age >= 18
    return false
  end

  def check_for_drunkeness?(customer)
    return true if customer.drunkeness >= @tolerance_level
    return false
  end

  def enough_drinks?(drink)
    return true if drink.stock_amount > 0
    return false
  end

  def get_stock_of_drink(drink_name)
    drink = get_drink_by_name(drink_name)
    return drink.stock_amount
  end

  def get_stock_of_all_drinks()
    total = 0
    for drink in @drinks
      total += drink.stock_amount
    end
    return total
  end
end
