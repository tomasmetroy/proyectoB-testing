class Ticket < ApplicationRecord
  belongs_to :showtime
  validates :user, presence: true
  validates :seat, numericality: { greater_than: 0 }
end
