class User < ActiveRecord::Base 
    has_secure_password 
    has_many :coupons
end 



Brand
Amount  
Expiration
Description
User_id 