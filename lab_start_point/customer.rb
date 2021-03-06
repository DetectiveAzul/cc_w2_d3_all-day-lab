class Customer
  attr_reader :name, :age, :drunkeness
  attr_accessor :wallet
  def initialize(name, age, wallet=0, drunkeness=0)
    @name = name
    @age = age
    @wallet = wallet
    @drunkeness = drunkeness
  end

  def pay(price)
    @wallet -= price
    @wallet = 0 if @wallet < 0
  end

  def enough_money?(price)
    return true if @wallet >= price
  end

  def buy(pub, drink_name)
    return nil if pub.check_for_age?(self) == false
    return nil if pub.check_for_drunkeness?(self) == true
    drink = pub.get_drink_by_name(drink_name)
    if drink != nil && enough_money?(drink.price) && pub.enough_drinks?(drink)
      pay(drink.price)
      drink.remove_stock(1)
      pub.add_money(drink.price)
      add_drunkeness(drink)
    end
  end

  def buy_food(pub, food_name)
    food = pub.get_food_by_name(food_name)
    if food != nil && enough_money?(food.price)
      pay(food.price)
      pub.add_money(food.price)
      remove_drunkeness(food)
    end
  end

  def add_drunkeness(drink)
    @drunkeness += drink.alcohol_level
  end

  def remove_drunkeness(food)
    @drunkeness -= food.rejuvenation_level
    @drunkeness = 0 if @drunkeness < 0
  end
end
