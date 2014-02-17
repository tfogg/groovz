class BidsController < ApplicationController

	def add_bids 

  @bid = current_user.bids.create(params[:bid])

  if @bid.save 
    flash[:notice] = "New Bid Added" 

    redirect_to :show => "view_show", :id => @bid.show_id
   end
end
end
