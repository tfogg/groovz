class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


   attr_accessible :email, :password, :password_confirmation, :remember_me,
   					:first_name, :last_name, :profile_name, :full_name, :role, :location, :avatar

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :profile_name, presence: true,
                              uniqueness: true,
                              format: {
                                with: /[a-zA-Z0-9_-]+/,
                                message: 'Must be formatted correctly'
                              }
    



    has_many :statuses
    has_many :posts
    has_many :shows
    has_many :albums
    has_many :pictures
    has_many :bids
    has_many :bid_on_shows, :through => :bids, :source => :show
    has_many :following, :through => :relationships, :source => :followed
    has_many :relationships, :foreign_key => "follower_id",
                           :dependent => :destroy
    has_many :reverse_relationships, :foreign_key => "followed_id",
                                   :class_name => "Relationship",
                                   :dependent => :destroy
    has_many :followers, :through => :reverse_relationships, :source => :follower

    has_attached_file :avatar, styles: {large: "800x800>", medium: "300x200>", small: "260x180>", thumbnail: "80x80#"}

    has_one :avatar

    validates_attachment :avatar, presence: true

    validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/jpg', 'image/png']
     

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
    	params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, :avatar, :location, :post_attributes => [:attachment])
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
