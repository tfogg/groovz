class UsersController < ApplicationController

	def index
		@users = User.all


    	respond_to do |format|
     	 format.html 
      	 format.json { render action: 'show' }
      	end
	end

	def following
	    @title = "Following"
	    @user = User.find_by_profile_name(params[:id])
	    @users = @user.followed_users.paginate(page: params[:page])
	    render 'show_follow'
  	end

    def followers
      @title = "Followers"
      @user = User.find_by_profile_name(params[:id])
      @users = @user.followers.paginate(page: params[:page])
      render 'show_follow'
    end



end
