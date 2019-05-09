require 'pry'
class VegetablesController < ApplicationController 
  
  get '/garden' do 
    @vegetables = Vegetable.all
    erb :'/vegetables/garden'
  end
  
  post '/garden' do 
    @gardener = Gardener.find_by(session[:id])
    @vegetable =  Vegetable.create(params)
    @vegetable.user_id = @gardener.id
    @vegetable.save
    redirect "/vegetables/#{@vegetable.id}"
  end
  
  get '/vegetables/new' do
    erb :'/vegetables/new'
  end
  
  post "/vegetables" do
    redirect "/vegetables"
  end

  get "/vegetables/:id" do
    @vegetable = Vegetable.find(params[:id])
    erb :"/vegetables/garden"
  end

  get "/vegetables/:id/edit" do
    @gardener = Gardener.find_by(session[:id])
    @vegetables = Vegetable.find(params[:id])
    if @gardener.id = @vegetable.user_id 
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