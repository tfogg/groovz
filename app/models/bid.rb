class Bid < ActiveRecord::Base 
	attr_accessible :user_id, :amount, :show_id

  belongs_to :show
  

  belongs_to :user, :class_name => "User" #, :foreign_key => "bidder_id"

  validates_presence_of :amount 
  validates_numericality_of :amount 








end