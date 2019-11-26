class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction


    


    def take_ride
      
        if  self.user.meets_ride_requirements(self.attraction) == "true"
            self.user.tickets -= self.attraction.tickets
            binding.pry
        else
            self.user.meets_ride_requirements(self.attraction)
        end
         
    end

    


    
    
end