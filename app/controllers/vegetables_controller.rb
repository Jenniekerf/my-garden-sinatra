require 'pry'
class VegetablesController < ApplicationController 
  
  get '/garden' do 
    @vegetables = Vegetable.all
    erb :'/vegetables/garden'
  end
  
  get '/vegetables' do 
    @vegetables = Vegetable.all
    binding.pry
    erb :'/vegetables/home'
  end
  
  get '/vegetables/new' do 
     erb :'/vegetables/new'
  end
  
  post '/vegetables' do 
    @gardener = Gardener.find_by(session[:id])
    @vegetable =  Vegetable.create(params)
    session[:gardener_id] = @gardener.id
    @vegetable.save
    redirect "/vegetables/#{@vegetable.id}"
  end
  
  get "/vegetables/:id" do
    @vegetable = Vegetable.find(params[:id])
    erb :'/vegetables/show'
  end

  get "/vegetables/:id/edit" do
    @gardener = Gardener.find_by(session[:id])
    @vegetable = Vegetable.find(params[:id])
    if session[:gardener_id] =  @gardener.id 
    erb :"/vegetables/edit"
  else 
    erb :"/vegetables/failure"
  end
end

  patch "/vegetables/:id" do
  @vegetable = Vegetable.find_by_id(params[:id])
  @vegetable.name = params[:name]
  @vegetable.date_planted = params[:date_planted]
  @vegetable.save
    redirect "/vegetables/#{@vegetable.id}"
  end

  delete "/vegetables/:id" do
    @vegetable = Vegetable.find(params[:id])
    @vegetable.delete 
    redirect "/vegetables"
  end

end
  
  
  