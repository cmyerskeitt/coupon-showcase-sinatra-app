class UsersController < ApplicationController

    #render login form 
    get "/login" do 
        erb :'users/login'
    end 

    #receive the data(params) from the login form
    post "/login" do
        #find the user
        user = User.find_by(email: params[:email])
        #authenticate the user 
        # binding.pry 
       if user && user.authenticate(params[:password])
            #creating a key/value pair in the session hash using the user id to log them in 
            session[:user_id] = user.id 
            #redirect user's profile(users show) 
            #dynamic route = id in session
            redirect "/users/#{user.id}"
       else
            #show an error message 
            redirect '/login'
        end 
    end

    #user show route
    get '/users/:id' do 
        @user = User.find_by(id: params[:id])
        # binding.pry 
        erb :'/users/show'
    end 

    #signup route that renders signup form
    get '/signup' do 
        erb :'/users/signup'
    end 

    #post signup route that receives params from user, creates user, logs them in 
    post '/user' do 
        @user = User.create(params)
        session[:user_id] = @user.id 
        redirect "/users/#{@user.id}"
    end 

   
    #get logout route that clears the session hash 
    get '/logout' do 
        session.clear
        redirect '/'
    end 

end 

