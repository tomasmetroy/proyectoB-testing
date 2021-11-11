class AddScheduleToShowtime < ActiveRecord::Migration[6.1]
  def change
    add_reference :showtimes, :schedule, null: false, foreign_key: true
  end
end
