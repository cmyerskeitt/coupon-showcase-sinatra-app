class CouponsController < ApplicationController 

    get '/coupons' do
        @coupons = Coupon.all
        erb :'coupons/index'
    end

    get '/coupons/:id' do
        @coupons = Coupon.find_by(params[:id])
        # binding.pry
        erb :'/coupons/show'
    end

end 