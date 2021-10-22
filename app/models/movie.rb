class Movie < ApplicationRecord
  validates :title, presence: true
  validates :director, presence: true
  validates :year, presence: true
  validates :year, numericality: true
  validates :plot, length: {minimum: 5}
end
