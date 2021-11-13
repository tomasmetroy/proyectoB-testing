class Showtime < ApplicationRecord
  belongs_to :movie
  belongs_to :theater
  belongs_to :schedule
  has_many :tickets
end
