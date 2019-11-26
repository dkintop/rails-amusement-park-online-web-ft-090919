class User < ActiveRecord::Base
    has_many :rides

    def has_enough_tickets(attraction)
        if self.tickets >= attraction.tickets
            return true
        else
            return false
        end
    end

    def is_tall_enough(attraction)
        if self.height >= attraction.min_height
            true
        else
             false
        end
    end

    def meets_ride_requirements(attraction)
       if self.is_tall_enough(attraction) && self.has_enough_tickets(attraction)
            "true"
       elsif !self.has_enough_tickets(attraction) &&self.is_tall_enough(attraction)
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif !self.is_tall_enough(attraction) && self.has_enough_tickets(attraction)
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif !self.is_tall_enough(attraction) && !self.has_enough_tickets(attraction)
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}." 

       end
    end


end
