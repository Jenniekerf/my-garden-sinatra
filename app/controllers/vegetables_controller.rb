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
  
  post "/vegetables" do
    redirect "/vegetables"
  end

  get "/vegetables/:id" do
    erb :"/vegetables/garden"
  end

  get "/vegetables/:id/edit" do
    @vegetables = Vegetable.all
    erb :"/vegetables/edit"
  end

  patch "/vegetables/:id" do
    redirect "/vegetables/:id"
  end

  delete "/vegetables/:id/delete" do
    redirect "/vegetables"
  end


  
  
end