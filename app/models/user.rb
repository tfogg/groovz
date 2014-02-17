class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


   attr_accessible :email, :password, :password_confirmation, :remember_me,
   					:first_name, :last_name, :profile_name, :full_name, :role, :location

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :profile_name, presence: true,
                              uniqueness: true,
                              format: {
                                with: /[a-zA-Z0-9_-]+/,
                                message: 'Must be formatted correctly'
                              }



    has_many :statuses
    has_many :shows, :foreign_key => "owner_id" 
    has_many :bids, :foreign_key => "owner_id"
    has_many :bid_on_shows, :through => :bids, :source => :show
    has_many :following, :through => :relationships, :source => :followed
    has_many :relationships, :foreign_key => "follower_id",
                           :dependent => :destroy
    has_many :reverse_relationships, :foreign_key => "followed_id",
                                   :class_name => "Relationship",
                                   :dependent => :destroy
    has_many :followers, :through => :reverse_relationships, :source => :follower

    def following?(followed)
      relationships.find_by_followed_id(followed)
    end

    def follow!(followed)
      relationships.create!(:followed_id => followed.id)
    end

    def unfollow!(followed)
      relationships.find_by_followed_id(followed).destroy
    end

    def current_user?
      @current_user ||= User.find_by_profile_name(params[:id])
    end

    def count 

    end

    def current_user_id
      @current_user_id = User.find_by_id(params[:id])
    end

    def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, :location)
  	end	

    def full_name
     	first_name + " " + last_name
     	
    end

    def to_param
      profile_name 
    end
    def gravatar_url 
      stripped_email= email.strip
      downcased_email = stripped_email.downcase
      hash = Digest::MD5.hexdigest (downcased_email)

      "http://gravatar.com/avatar/#{hash}"

    end
    
    ROLES = %w[admin venue artist fan]

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
