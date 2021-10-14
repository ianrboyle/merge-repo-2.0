class ActorsController < ApplicationController
  def get_actors
    actors = Actor.all
    render json: {actors: actors.as_json}
  end

  def get_actor_id_1
    actor = Actor.find_by(id: 1)
    render json: {actor: actor.as_json}
  end
end
