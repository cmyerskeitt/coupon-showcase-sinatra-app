class CouponsController < ApplicationController 

    get '/coupons' do
        @coupons = Coupon.all
        erb :'coupons/index'
    end

    get '/coupons/:id' do
        @coupons = Coupon.find(params[:id])
        erb :'/coupons/show'
    end

end 