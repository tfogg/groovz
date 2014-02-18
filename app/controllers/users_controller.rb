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
	    @users = @user.following(page: params[:page])
	    render 'show_follow'
  	end


    def followers
      @title = "Followers"
      @user = User.find_by_profile_name(params[:id])
      @users = @user.followers(page: params[:page])
      render 'show_follow'
    end


   	def show
	  	@user = User.find_by_profile_name(params[:id])
	  	if @user
	  		@statuses = @user.statuses.all
	  		render action: :show
	  	else
	  		render file: 'public/404', status: 404, formats: [:html]
	    end
  	end
  	def setup
    	@user = User.find_by_profile_name(params[:id])
  	end

  	ROLES = %w[admin venue artist fan]
	  def is_venue?
	    @user = User.find_by_profile_name(params[:role]) 
	    role.downcase== "venue"
	  end

	  def is_artist?
	    @user = User.find_by_profile_name(params[:role]) 
	    role.downcase== "artist"
	  end

	  def is_fan? 
	    @user = User.find_by_profile_name(params[:role])
	    role.downcase== "fan"
	  end

	  def is_admin? 
	    @user = User.find_by_profile_name(params[:role])
	    role.downcase== "admin"
	  end




end
