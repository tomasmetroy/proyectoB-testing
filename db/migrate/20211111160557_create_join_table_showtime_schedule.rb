class CreateJoinTableShowtimeSchedule < ActiveRecord::Migration[6.1]
  def change
    create_join_table :showtimes, :schedules do |t|
      # t.index [:showtime_id, :schedule_id]
      # t.index [:schedule_id, :showtime_id]
    end
  end
end
