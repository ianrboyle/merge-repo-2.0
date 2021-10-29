class Movie < ApplicationRecord
  has_many :actors
  has_many :movie_genres
  has_many :genres, through: :movie_genres

  # has_many :genres, through: :movie_genre
  # validates :title, presence: true
  # validates :director, presence: true
  # validates :year, presence: true
  # validates :year, numericality: true
  # validates :plot, length: {minimum: 5}
end
