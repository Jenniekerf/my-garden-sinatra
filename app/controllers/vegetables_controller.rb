require 'pry'
class VegetablesController < ApplicationController 
  
  get '/garden' do 
    @vegetables = Vegetable.all
    erb :'/vegetables/garden'
  end
  
  post '/garden' do 
    @vegetables =  Vegetable.create(params)
    @vegetables.user_id = session[:user_id]
  end
  
  get '/vegetables/new' do
    erb :'/vegetables/new'
  end
  
  
end