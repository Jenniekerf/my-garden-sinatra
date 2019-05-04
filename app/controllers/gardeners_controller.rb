require "pry"
class GardenersController < ApplicationController 
  
  get '/gardeners/login' do 
    erb :'/gardeners/login' 
  end
  
  post '/login' do
   @gardener = Gardener.find_by(:username => params[:username])
   if @gardener 
     session[:user_id] = @gardener.id
   redirect to '/garden'
   else 
   redirect to '/gardeners/error'
  end
  end
  
  get '/gardeners/error' do 
    erb :'/gardeners/error'
  end
  
  
  post '/signup' do
    @gardener = Gardener.new(username: params[:username], password_digest: params[:password])
    @gardener.save
    session[:user_id] = @gardener.id
  end

  
end