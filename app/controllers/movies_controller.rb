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
end
