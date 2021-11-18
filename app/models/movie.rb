class Movie < ApplicationRecord
  has_many :showtimes
  has_one_attached :image, dependent: :destroy
end
