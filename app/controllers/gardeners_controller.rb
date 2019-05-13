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
    erb :'gardeners/login' 
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
 
 get '/gardeners/goodbye' do 
   erb :'gardeners/goodbye'
 end
 
 post '/goodbye' do 
    if session[:gardener_id] !=nil 
	    session.clear
   erb :'gardeners/goodbye'
  end
 end
 
 
  
end

	