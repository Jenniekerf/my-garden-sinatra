require 'pry'
class VegetablesController < ApplicationController 
  
  get '/garden' do 
    @vegetables = Vegetable.all
    erb :'/vegetables/garden'
  end
  
  post '/garden' do 
    @vegetables = Vegetable.new(params)
    @vegetables.user_id = session[:user_id]
    @vegetables.save 
  end
  
  get '/vegetables/new' do
    erb: :'/vegetables/new'
  end
  
end