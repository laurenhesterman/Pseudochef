Rails.application.routes.draw do
  root 'users#index' 
  get '/new'  => 'users#new'
  get '/user/:id' => 'users#user'
  get '/recipe/search' => 'recipes#search'  
  post '/recipe/find' => 'recipes#find'
  get '/recipe/new' => 'recipes#new'
  
  post '/recipe/new' => 'recipes#create'
  
  get 'recipe/nutrition' => 'recipes#nutrition'
  get '/recipe/:id' => 'recipes#show'
  post '/sessions/create' => 'sessions#create'
  post '/users/create' => 'users#create'
  post '/recipe/search' => 'recipes#search'
  delete '/recipe/:id' => 'recipes#destroy'
  delete 'sessions/:id' => 'sessions#destroy'
end
