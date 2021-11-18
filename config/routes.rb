Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  ###MOVIE GENRE ROUTES
  post "/movie_genres" => "movie_genres#create"
  
  ###MOVIE ROUTES
  get "/movies" => "movies#index"
  get "movies/:id" => "movies#show"
  post "/movies" => "movies#create"
  put "/movies/:id" => "movies#update"
  delete "/movies/:id" => "movies#destroy"
  

  ###ACTOR ROUTES
  get "/actors" => "actors#index"
  get "/actors/:id" => "actors#show"
  post "/actors" => "actors#create"
  put "/actors/:id" => "actors#update"
  delete "/actors/:id" => "actors#destroy"

  ###USER ROUTES
  post "/users" => "users#create"

  ###SESSION ROUTES
  post "/sessions" => "sessions#create"
end
