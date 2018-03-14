class Customer
  attr_reader :name, :age
  attr_accessor :wallet
  def initialize(name, age, wallet=0)
    @name = name
    @age = age
    @wallet = wallet
  end
end
