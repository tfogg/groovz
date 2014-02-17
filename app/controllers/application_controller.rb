class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters 
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :profile_name, :user_id, :role, :location) } 
	end

	def after_sign_up_path_for(resource_or_scope)
    	setup_path(current_user)
  end

  def after_sign_in_path_for(resource)
  		if @user
        @user.sign_in_count = 1
        setup_path(current_user)
      else
        profile_path(current_user)
      end
	end

	def is_venue? 
      role.downcase== "venue"
    end

    def is_artist? 
      role.downcase== "artist"
    end

    def is_fan? 
      role.downcase== "fan"
    end

    def is_admin? 
      role.downcase== "admin"
    end
end
