class CreateJoinTableTicketShowtime < ActiveRecord::Migration[6.1]
  def change
    create_join_table :tickets, :showtimes do |t|
      # t.index [:ticket_id, :showtime_id]
      # t.index [:showtime_id, :ticket_id]
    end
  end
end
