class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :name
      t.string :range

      t.timestamps
    end
  end
end
