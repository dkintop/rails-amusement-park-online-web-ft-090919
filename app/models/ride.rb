class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction


    


    def take_ride
        if !self.check_tickets && !self.check_height
            self.not_enough_tickets + self.not_tall_enough 
        
        elsif !self.check_tickets && self.check_height
            self.not_enough_tickets
        elsif !self.check_height && self.check_tickets
            self.not_tall_enough
        end

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
        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    end

    def not_tall_enough
        "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    end
    
    
end