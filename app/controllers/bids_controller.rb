class BidsController < ApplicationController

	



	def add_bids 

	  @bid = current_user.bids.create(params[:bid])

	  	if @bid.save 
	    	flash[:notice] = "New Bid Added" 

	    	redirect_to :show => "view_show", :id => @bid.show_id
   		end
	end

	def index
		@bids = Bid.all
		
	end

	def show
		@bid = Bid.find(params[:id])
		

	end


	def new 
		@bid =Bid.new
		@bid.user_id = current_user.id if current_user
		@bid.build_show


	end

	def create
		@bid =Bid.new(bid_params)
		@bid.user = current_user
		@show = @bid.show

	    respond_to do |format|
	      if @bid.save
	      	flash[:notice] = "New Bid Added" 

	        format.html { redirect_to @bid, notice: 'Your show has been updated.'}
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
