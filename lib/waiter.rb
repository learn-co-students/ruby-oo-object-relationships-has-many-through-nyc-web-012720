class Waiter
 
    attr_accessor :name, :yrs_experience
   
    @@all = []
   
    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all << self
    end
   
    def self.all
      @@all
    end

    def new_meal (customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|x| x.waiter === self}
    end

    def best_tipper
        tipper = meals.max_by {|x| x.tip}
        tipper.customer
    end
   
end