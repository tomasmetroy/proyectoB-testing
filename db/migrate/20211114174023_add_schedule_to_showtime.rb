class AddScheduleToShowtime < ActiveRecord::Migration[6.1]
  def change
    add_column :showtimes, :schedule, :string
  end
end
