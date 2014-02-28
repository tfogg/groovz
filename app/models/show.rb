class Show < ActiveRecord::Base
	attr_accessible :content, :user_id, :maxprice, :start_time, :bid_id
	
	belongs_to :user, :class_name => "User" 
  	has_many :bids 

  # Given the nature of your relationships, you're going to want to add this      
  # to quickly find out who bid on an object.
  	has_many :bidders, :through => :bids

  	validates_presence_of :user_id
  	validates_presence_of :content 
  	validates_presence_of :maxprice
  	validates_presence_of :start_time 

    attr_reader :bids

    has_many :statuses
end
