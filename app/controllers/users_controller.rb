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
            flash[:message] = "Welcome back, #{user.name}!" 
            #redirect user's profile(users show) 
            #dynamic route = id in session
            redirect "/users/#{user.id}"
       else
            #show an error message 
            flash[:error] = "Your credentials were invalid. Try again!"
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
    post '/users' do 

        @user = User.new(email: params[:email], password: params[:password], name: params[:name], image_url: params[:image_url],  
        savings_goal: params[:savings_goal])
        if @user.save 
            session[:user_id] = @user.id 
            flash[:message] = "Created new user successfully!"
            redirect "/users/#{@user.id}"
        else 
            flash[:error] = "User creation failed: #{@user.errors.full_messages.to_sentence}"
            redirect "/signup"
        end 
    end 
   
    #get logout route that clears the session hash 
    get '/logout' do 
        session.clear
        redirect '/'
    end 

end 

