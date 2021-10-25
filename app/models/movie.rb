class Movie < ApplicationRecord
  has_many :actors
  # validates :title, presence: true
  # validates :director, presence: true
  # validates :year, presence: true
  # validates :year, numericality: true
  # validates :plot, length: {minimum: 5}
end
