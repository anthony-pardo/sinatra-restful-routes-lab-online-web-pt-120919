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
    redirect to("/recipes/#{article.id}")
  end
  
  get '/recipes/:id' do 
    
  end

end
