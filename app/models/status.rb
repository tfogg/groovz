class Status < ActiveRecord::Base
	attr_accessible :content, :user_id, :first_name, :last_name, :full_name
	belongs_to :user

end
