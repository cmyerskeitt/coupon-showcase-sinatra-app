class CouponsController < ApplicationController 

get '/coupons' do
    @coupons = Coupon.all
    erb :'coupons/index'
end




end 