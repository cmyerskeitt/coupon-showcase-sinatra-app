class UsersController < ApplicationController

    #render login form 
    get "/login" do 
        erb :login
    end 

    #receive the data(params) from the login form
    post "/login" do
        #find the user
        user = User.find_by(email: params[:email])
        #authenticate the user 
       if user && user.authenticate(params[:password])
            #log them in 
            #redirect user's profile(users show) 
            
       else
            #show an error message 
            redirect '/login'
            
        end 
    end

end 