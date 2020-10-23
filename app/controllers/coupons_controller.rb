class CouponsController < ApplicationController 

    get '/coupons' do
        @coupons = Coupon.all
        erb :'coupons/index'
    end

    get '/coupons/new' do 
        if logged_in?
            erb :'/coupons/new'
        else 
            flash[:error] = " You must be logged in to create a coupon!"
            redirect "/"
        end 
    end 

    post '/coupons' do 
        # if params[:brand] !="" && params[:amount] !="" && params[:expiration] !="" && params[:description] !=""/ refactored with validations
        coupon = Coupon.new(brand: params[:brand], amount: params[:amount], expiration: params[:expiration], description: params[:description], user_id: current_user.id)
        if coupon.save 
            flash[:message] = "Created coupon successfully!"
            redirect "/coupons/#{coupon.id}"
        else 
            flash[:error] = "Coupon creation failed: #{coupon.errors.full_messages.to_sentence}"
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
        if authorize_to_edit?(@coupon)
            erb :'/coupons/edit'
        else
            flash[:error] = "Not authorized to edit that post!"
            redirect "/coupons"
        end
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