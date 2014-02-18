class BidsController < ApplicationController

	



	def add_bids 

	  @bid = current_user.bids.create(params[:bid])

	  	if @bid.save 
	    	flash[:notice] = "New Bid Added" 

	    	redirect_to :show => "view_show", :id => @bid.show_id
   		end
	end


	def new 
		@show = Show.find(params[:show_id])
		@bid = @show.bids.build

	end

	def create
	    @item = Item.find(params[:item_id])
	    @bid = @item.bids.new(bid_params)
	    respond_to do |format|
	      if @bid.save
	        format.html { redirect_to @item, notice: 'Your item has been updated.'}
	      else
	        format.html { render action: 'new' }
	      end
	    end
	end

	def set_bid
		@bid= Bid.find(params[:id])
	end
	
	def bid_params 
		params[:bid][:user_id] = current_user.id
		params[:bid].permit(:amount, :user_id, :show_id)
	end

end
