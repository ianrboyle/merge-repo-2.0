Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/actors" => "actors#index"
  get "/movies" => "movies#index"
  get "movies/:id" => "movies#show"
  get "/actors/:id" => "actors#show"
  post "/actors" => "actors#create"
  post "/movies" => "movies#create"
  patch "/movies/:id" => "movies#update"
  patch "/actors/:id" => "actors#update"
  delete "/movies/:id" => "movies#destroy"
  delete "/actors/:id" => "actors#destroy"
end
