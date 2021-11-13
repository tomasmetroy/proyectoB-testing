class RemoveScheduleFromMovie < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :schedule, :string
  end
end
