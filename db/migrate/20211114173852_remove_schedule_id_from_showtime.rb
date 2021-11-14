class RemoveScheduleIdFromShowtime < ActiveRecord::Migration[6.1]
  def change
    remove_column :showtimes, :schedule_id, :string
  end
end
