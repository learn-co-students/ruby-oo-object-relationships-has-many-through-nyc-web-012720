class Waiter
    attr_reader :name, :years_of_experience
    @@all = []
    def initialize(name, years_of_experience)
        @name = name
        @years_of_experience = years_of_experience
        @@all << self
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        self.meals.max do |tip_1, tip_2|
            tip_1.tip <=> tip_2.tip
        end.customer
    end

    def self.all 
        @@all
    end 

end