class MoviesController < ApplicationController
  def get_movies
    movies = Movie.all.as_json
    render json: {movies: movies.as_json}
  end
  def get_one_movie
    movie_id = params[:id].to_i
    movie = Movie.find_by(id: movie_id)
    render json: {movie: movie.as_json}
  end
  def get_single_actor
    actor_id = params["id"]
    actor = Actor.find_by(id: actor_id)
    render json: {message: actor}
  end
end
