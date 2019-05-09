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
     session[:user_id] = @gardener.id
    redirect to '/vegetables'
  end
end

  get '/login' do 
    erb :'gardeners/login' 
  end
  
   post "/login" do
		gardener = Gardener.find_by(username: params[:username])
		#binding.pry
		if gardener && gardener.authenticate(params[:password])
    session[:user_id] = gardener.id
    redirect '/vegetables'
		else 
		  redirect "/gardeners/error"
		end
	end
	
	get '/gardeners/error' do
	  erb :'gardeners/error'
	end
	
	get '/logout' do
	  if seeion[:user_id] !=nil 
	    session.destroy
	    redirect 'gardeners/index'
	  else 
	    redirect 'gardeners/index'
	  end
 end 
  
end

	