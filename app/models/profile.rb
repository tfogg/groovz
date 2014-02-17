class Profile < ActiveRecord::Base

	def is_venue? 
      role.downcase== "venue"
    end

    def is_artist? 
      role.downcase== "artist"
    end

    def is_fan? 
      role.downcase== "fan"
    end

    def is_admin? 
      role.downcase== "admin"
    end
end