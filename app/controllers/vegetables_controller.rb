require 'pry'
class VegetablesController < ApplicationController 
  
  get '/vegetables' do 
    if logged_in? && current_user
      @gardener = current_user
    erb :'/vegetables/home'
  else 
    redirect '/login'
    end
  end
  
  get '/vegetables/new' do 
     erb :'/vegetables/new'
  end
  
  get '/vegetables/garden' do
    @vegetables = Vegetable.all
    erb :'/vegetables/garden'
  end
  
  get '/failure' do
    erb :'/vegetables/failure'
  end
  
  post '/vegetables' do
    @gardener = current_user
    @vegetable =  Vegetable.create(params)
    @vegetable.gardener_id = @gardener.id
    @vegetable.save
    redirect "/vegetables/#{@vegetable.id}"
  end
  
 get "/vegetables/:id" do
    @vegetable = Vegetable.find(params[:id])
     erb :'/vegetables/show' 
  end
  
  patch '/vegetables/:id' do
  @vegetable = Vegetable.find_by_id(params[:id])
  @vegetable.name = params[:name]
  @vegetable.date_planted = params[:date_planted]
  @vegetable.save
    redirect "/vegetables/#{@vegetable.id}"
  end
  
  get '/vegetables/:id/edit' do
    if logged_in?
    @vegetable = Vegetable.find(params[:id])
    erb :'/vegetables/edit'
  else 
     erb :'/vegetables/failure'
  end
end 

  delete "/vegetables/:id" do
    @vegetable = Vegetable.find(params[:id])
    @vegetable.delete 
    redirect "/vegetables"
  end

end
  
  
  