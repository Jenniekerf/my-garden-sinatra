require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "thesecretgarden"
  end

  get "/" do
    erb :'gardeners/index'
  end
  
  helpers do
    def logged_in?
      !!session[:gardener_id]
    end 
    
    def current_user?
      Gardener.find(session[:gardener_id])
    end
  end

end
