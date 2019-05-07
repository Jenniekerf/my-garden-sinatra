require "pry"
class GardenersController < ApplicationController 
  
  get '/login' do 
    erb :'/gardeners/login' 
  end
  
  post '/login' do
   @gardener = Gardener.find_by(:username => params[:username])
   if @gardener 
     session[:user_id] = @gardener.id
   redirect to '/gardeners/show'
   else 
   redirect to '/gardeners/error'
  end
  end
  
  
  get '/gardeners/:id' do
    if !logged_in?
      redirect '/gardeners/login'
    end

    @gardener = Gardener.find(params[:id])
    if !@gardener.empty? && @gardener == current_user
      erb :'/gardeners/show'
    else
      redirect '/gardeners/login'
    end
  end
  
  
  
  get '/gardeners/error' do 
    erb :'/gardeners/error'
  end
  
  post '/signup' do
    @gardener = Gardener.new(:username => params[:username], :password_digest => params[:password])
    @gardener.save
    session[:user_id] = @gardener.id
    redirect to '/gardeners/show'
  end
end


