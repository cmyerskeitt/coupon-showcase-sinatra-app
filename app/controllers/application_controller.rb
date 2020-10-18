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
    erb :welcome
  end

  helpers do 
    #keeps track of the login user
    def current_user 
      User.find_by(id: session[:user_id])
    end 
  end 
end
