require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    #enable the session hash 
    enable :sessions
    #set a session secret for an extra layer of security 
    set :session_secret, "coupon_xtremesuper_secret_session"
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else 
      erb :welcome
    end 
  end

  helpers do 
    #keeps track of the login user
    def current_user 
      User.find_by(id: session[:user_id])
    end 
    #returns a boolean if the user is logged in or not 
    #double bang converts turthy/falsy to hard true/false
    def logged_in?
      !!current_user
    end 
  end 
end
