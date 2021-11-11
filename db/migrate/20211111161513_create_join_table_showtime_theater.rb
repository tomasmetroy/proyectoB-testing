class CreateJoinTableShowtimeTheater < ActiveRecord::Migration[6.1]
  def change
    create_join_table :showtimes, :theaters do |t|
      # t.index [:showtime_id, :theater_id]
      # t.index [:theater_id, :showtime_id]
    end
  end
end
