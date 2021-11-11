class Showtime < ApplicationRecord
  has_one :movie
  has_one :theater
  has_one :schedule
end
