require 'pry'
class VegetablesController < ApplicationController 
  
  get '/garden' do 
    @vegetables = Vegetable.all
    erb :'/vegetables/garden'
  end
  
  get '/vegetables' do 
    erb :'/vegetables/home'
  end
  
  get '/new' do 
    erb :'/vegetables/new'
  end
  
  post '/vegetables' do 
    @gardener = Gardener.find_by(session[:id])
    @vegetable =  Vegetable.create(params)
    @vegetable.users_id = @gardener.id
    @vegetable.save
    redirect "/vegetables/#{@vegetable.id}"
  end
  
  get "/vegetables/:id" do
    @vegetable = Vegetable.find(params[:id])
    erb :'/vegetables/show'
  end

  get "/vegetables/:id/edit" do
    @gardener = Gardener.find_by(session[:id])
    @vegetables = Vegetable.find(params[:id])
    if @gardener.id = @vegetable.users_id 
    erb :"/vegetables/edit"
  else 
    erb :"/vegetables/failure"
  end
end

  patch "/vegetables/:id" do
  @vegetable = Vegetable.find_by_id(params[:id])
  @vegetable.name = params[:name]
  @vegetable.datetime = params[:datetime]
  @vegetable.save
    redirect "/vegetables/#{@vegetable.id}"
  end

  delete "/vegetables/:id" do
    @vegetable = Vegetable.find(params[:id])
    @vegetable.delete 
    redirect "/vegetables"
  end

end
  
  
  