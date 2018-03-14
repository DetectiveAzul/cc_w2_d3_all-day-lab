class Customer
  attr_reader :name, :age
  attr_accessor :wallet
  def initialize(name, age, wallet=0)
    @name = name
    @age = age
    @wallet = wallet
  end

  def pay(price)
    @wallet -= price
  end

  def enough_money?(price)
    return true if @wallet >= price
  end

  def buy(pub, drink_name)
    drink = pub.get_drink_by_name(drink_name)
    if drink != nil && enough_money?(drink.price)
      pay(drink.price)
      pub.add_money(drink.price)
    end
  end
end
