class AddShowtimeToTicket < ActiveRecord::Migration[6.1]
  def change
    add_reference :tickets, :showtime, null: false, foreign_key: true
  end
end
