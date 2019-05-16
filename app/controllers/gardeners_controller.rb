require "pry"
class GardenersController < ApplicationController 
  
  get '/signup' do 
    erb :'gardeners/signup'
  end
  
  post '/signup' do
   if params[:username].empty? || params[:password].empty?
     redirect '/signup'
   else 
     @gardener = Gardener.create(:username => params[:username], :password => params[:password])
     session[:gardener_id] = @gardener.id
    redirect to '/vegetables'
  end
end

  get '/login' do 
    if !logged_in?
    erb :'gardeners/login' 
  else 
    @gardener = current_user
    session[:gardener_id] = @gardener.id
    redirect to '/vegetables'
  end
  end
  
   post '/login' do
		gardener = Gardener.find_by(:username => params[:username])
		if gardener && gardener.authenticate(params[:password])
    session[:gardener_id] = gardener.id
    redirect '/vegetables'
		else 
		  redirect "/gardeners/error"
		end
	end
	
	get '/gardeners/error' do
	  erb :'gardeners/error'
	end
 
 get '/logout' do 
    session.clear
   erb :'/gardeners/goodbye'
 end
 
  
end

	