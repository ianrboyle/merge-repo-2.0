class ActorSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :age, :known_for, :movie
end
