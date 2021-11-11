class CreateJoinTableShowtimeMovie < ActiveRecord::Migration[6.1]
  def change
    create_join_table :showtimes, :movies do |t|
      # t.index [:showtime_id, :movie_id]
      # t.index [:movie_id, :showtime_id]
    end
  end
end
