class CouponsController < ApplicationController 

    get '/coupons' do
        @coupons = Coupon.all
        erb :'coupons/index'
    end

    get '/coupons/new' do 
        erb :'/coupons/new'
    end 

    post '/coupons' do 
        # if params[:brand] !="" && params[:amount] !="" && params[:expiration] !="" && params[:description] !=""
        coupon = Coupon.new(brand: params[:brand], amount: params[:amount], expiration: params[:expiration], description: params[:description], user_id: current_user.id)
        if coupon.save 
            flash[:message] = "Created coupon successfully!"
            redirect "/coupons/#{coupon.id}"
        else 
            flash[:error] = "Coupon creation failed: Please fill in ALL inputs."
            redirect "/coupons/new"
        end 
    end 

    get '/coupons/:id' do
        @coupon = Coupon.find(params[:id])
        # binding.pry
        erb :'/coupons/show'
    end

    get '/coupons/:id/edit' do 
        @coupon = Coupon.find(params[:id])
        erb :'/coupons/edit'
    end 

    patch '/coupons/:id' do
        @coupon = Coupon.find(params[:id])
        @coupon.update(brand: params[:brand], amount: params[:amount], expiration: params[:expiration], description: params[:description])
        redirect "/coupons/#{@coupon.id}"
    end
  
    delete '/coupons/:id' do
        @coupon = Coupon.find(params[:id])
        @coupon.destroy
        redirect '/coupons'
    end

end 