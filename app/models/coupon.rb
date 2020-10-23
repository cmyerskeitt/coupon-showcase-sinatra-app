class Coupon < ActiveRecord::Base
    belongs_to :user 
    validates :brand, :amount, :expiration, :description, presence: true 
end
