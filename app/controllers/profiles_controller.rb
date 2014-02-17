class ProfilesController < ApplicationController
 

 def index
    @users = User.all


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

  def current_user
      @current_user ||= User.find_by_profile_name(params[:id])
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
