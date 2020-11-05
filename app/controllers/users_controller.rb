class UsersController < ApplicationController

  
    get "/login" do 
        erb :'users/login'
    end 

    
    post "/login" do

        user = User.find_by(email: params[:email])
        # binding.pry 
       if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            flash[:message] = "Welcome back, #{user.name}! Time to save!" 
            redirect "/users/#{user.id}"
       else
            flash[:error] = "Invalid credentials. Try again!"
            redirect '/login'
        end 
    end

  
    get '/users/:id' do 
        @user = User.find_by(id: params[:id])
        # binding.pry 
        erb :'/users/show'
    end 


    get '/signup' do 
        erb :'/users/signup'
    end 

    post '/users' do 

        @user = User.new(email: params[:email], password: params[:password], name: params[:name], image_url: params[:image_url],  
        savings_goal: params[:savings_goal])
        if @user.save 
            session[:user_id] = @user.id 
            flash[:message] = "New user successfully created!"
            redirect "/users/#{@user.id}"
        else 
            flash[:error] = "User creation failed: #{@user.errors.full_messages.to_sentence}"
            redirect "/signup"
        end 
    end 
   
  
    get '/logout' do 
        session.clear
        redirect '/'
    end 

end 

