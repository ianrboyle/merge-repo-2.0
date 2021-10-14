class ActorsController < ApplicationController
  def get_actors
    actors = Actor.all
    render json: {actors: actors.as_json}

  
  end
end
