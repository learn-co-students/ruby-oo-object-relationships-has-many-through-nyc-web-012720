class Customer
    attr_reader :name, :age
    @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def new_meal(waiter, total, tip)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    Meal.all.select do |meals|
        meals.customer == self
    end
  end
  
  def waiters
    self.meals.map do |waiters|
        waiters.waiter
    end
  end

  def self.all 
    @@all
  end

end