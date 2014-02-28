class Status < ActiveRecord::Base
	attr_accessible :content, :user_id, :show_id, :first_name, :last_name, :full_name, :post_attributes, :attachment, :avatar

	belongs_to :user
	belongs_to :show
	has_one :post

	accepts_nested_attributes_for :post


	

end
