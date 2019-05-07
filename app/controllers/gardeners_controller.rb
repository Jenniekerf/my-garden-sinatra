require "pry"
class GardenersController < ApplicationController 
  
  get '/login' do 
    erb :'/gardeners/login' 
  end
  
   post "/login" do
		gardener = Gardener.find_by(username: params[:username])
		#binding.pry
		if gardener && gardener.authenticate(params[:password])
    session[:user_id] = gardener.id
		  redirect "/vegetables/garden"
		else 
		  redirect "/gardeners/error"
		end
	end
  
  
  get '/gardeners/:id' do
    if !logged_in?
      redirect '/gardeners/login'
    end

    @gardener = Gardener.find(params[:id])
    if !@gardener.empty? && @gardener == current_user
      erb :'/vegetables/garden'
    else
      redirect '/gardeners/login'
    end
  end
  
  get '/gardeners/error' do 
    erb :'/gardeners/error'
  end
  
  get '/signup' do 
    erb :'/gardeners/signup'
  end
  
  get '/vegetables/garden' do
    erb :'/vegetables/garden'
  end
  
  post '/signup' do
    @gardener = Gardener.new(:username => params[:username], :password => params[:password])
    @gardener.save
    #binding.pry
    session[:user_id] = @gardener.id
    redirect to '/vegetables/garden'
  end
end

	