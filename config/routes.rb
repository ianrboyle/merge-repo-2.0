Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/all_actors" => "actors#get_actors"
  get "/id_1" => "actors#get_actor_id_1"
  get "/movies" => "movies#get_movies"
  get "movie_by_id/:id" => "movies#get_one_movie"
  get "/actors" => "movies#get_single_actor"
end
