class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  
  get '/recipes/new' do 
    erb :new
  end
  
  post '/recipes/new' do 
    recipe = Recipe.new(params)
    recipe.save
    redirect "/recipes/#{recipe.id}"
  end
  
  get '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    erb :show
  end
  
  delete '/recipes/:id' do 
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect to('/recipes')
  end
  
  get '/recipes' do 
    @recipes = Recipe.all 
    erb :index
  end 
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end
 
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.save
    redirect to("/recipes/#{@recipe.id}")
  end
  
  delete '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
  end

end
