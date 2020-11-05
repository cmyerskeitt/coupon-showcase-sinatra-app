class User < ActiveRecord::Base 
    has_secure_password 
    has_many :coupons
    validates :email, :password, :name, :image_url, :savings_goal, presence: true 
    validates_uniqueness_of :email 
end 


