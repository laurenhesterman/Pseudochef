Rails.application.routes.draw do
  root 'users#index' 
  get '/new'  => 'users#new'
  get '/user/:id' => 'users#user'
  get '/recipe/search' => 'recipes#search'  
  post '/recipe/search' => 'recipes#search'
  get '/recipe/new' => 'recipes#new'
  
  post '/recipe/new' => 'recipes#create'
  
  get 'recipe/nutrition' => 'recipes#nutrition'
  get '/recipe/:id' => 'recipes#show'
  post '/recipe/:id/upvote' => 'recipes#upvote'
  post '/recipe/:id/downvote' => 'recipes#downvote'
  post '/sessions/create' => 'sessions#create'
  post '/users/create' => 'users#create'
  post '/recipe/search' => 'recipes#search'
  delete '/recipe/:id' => 'recipes#destroy'
  delete 'sessions/:id' => 'sessions#destroy'
end
