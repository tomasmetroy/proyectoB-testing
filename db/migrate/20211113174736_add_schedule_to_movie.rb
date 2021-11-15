class AddScheduleToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :schedule, :string
  end
end
