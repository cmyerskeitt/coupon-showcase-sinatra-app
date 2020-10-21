class CouponsController < ApplicationController 

    get '/coupons' do
        @coupons = Coupon.all
        erb :'coupons/index'
    end

    get '/coupons/new' do 
        erb :'/coupons/new'
    end 

    post '/coupons' do 
        coupon = Coupon.create(brand: params[:brand], amount: params[:amount], expiration: params[:expiration], description: params[:description], user_id: current_user.id)
        redirect "/coupons/#{coupon.id}"
    end 

    get '/coupons/:id' do
        @coupons = Coupon.find_by(params[:id])
        # binding.pry
        erb :'/coupons/show'
    end

  

end 