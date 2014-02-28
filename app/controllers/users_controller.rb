class UsersController < ApplicationController

	def index
		@users = User.all
		@posts = Post.all
		


    	respond_to do |format|
     	 format.html 
      	 format.json { render action: 'show' }
      	end
	end
	def feed
		@users = User.all
		@statuses = Status.all
		@posts = Post.all
		@shows = Show.all
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
   		@status = Status.new
   		@status.user_id = current_user.id if current_user

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
	  	@users = User.all
	    @user = User.find_by_profile_name(params[:role]) 
	    role.downcase== "venue"
	  end

	  def is_artist?
	  	@users = User.all
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

	def artists
  		@users = User.all
  		@shows = Show.all

  		


  		
  	end

  	def venues

  		@users = User.all
  		@shows = Show.all

  	end

  	def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, :avatar, :location, :post_attributes => [:attachment])
  	end	





end
