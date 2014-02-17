class Show < ActiveRecord::Base
	attr_accessible :content, :user_id, :first_name, :last_name, :full_name, :role
	
	belongs_to :creator, :class_name => "User" 
  	has_many :bids 

  # Given the nature of your relationships, you're going to want to add this      
  # to quickly find out who bid on an object.
  	has_many :bidders, :through => :bids

  	validates_presence_of :user_id
  	validates_presence_of :content 
  	validates_presence_of :maxprice
  	validates_presence_of :start_time attr_reader :bids
end
