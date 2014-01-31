class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


   attr_accessible :email, :password, :password_confirmation, :remember_me,
   					:first_name, :last_name, :profile_name, :full_name


   	has_many :statuses

   	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end	




   def full_name
   	first_name + " " + last_name
   	
   end
 
  
end
