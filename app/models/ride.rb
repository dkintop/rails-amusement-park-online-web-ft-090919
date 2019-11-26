class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction


    


    def take_ride
        
        if !self.check_tickets && !self.check_height
           "Sorry. " + self.not_enough_tickets + " #{self.not_tall_enough}" 
        
        elsif !self.check_tickets && self.check_height
           "Sorry. " + self.not_enough_tickets
        elsif !self.check_height && self.check_tickets
            "Sorry. " + self.not_tall_enough
        else

            self.update_tickets
            self.update_nausea
            self.update_happiness

        end

    end

    def update_tickets
        self.user.tickets -= self.attraction.tickets
        User.update(self.user.id, tickets: self.user.tickets)
    end

    def update_nausea
        self.user.nausea += self.attraction.nausea_rating
        User.update(self.user.id, nausea: self.user.nausea)
    end

    def update_happiness
        self.user.happiness += self.attraction.happiness_rating
        User.update(self.user.id, happiness: self.user.happiness)
    end
    
    def check_tickets
        if self.user.tickets >= self.attraction.tickets
            true
        else
            false
        end
    end

    def check_height
        if self.user.height >= self.attraction.min_height
            true
        else
            false
        end
    end

    def not_enough_tickets
        "You do not have enough tickets to ride the #{self.attraction.name}."
    end

    def not_tall_enough
        "You are not tall enough to ride the #{self.attraction.name}."
    end
    
    
end