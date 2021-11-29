class CreateShowtimes < ActiveRecord::Migration[6.1]
  def change
    create_table :showtimes do |t|
      t.references :movie, null: false, foreign_key: true
      t.string :theater, null: false
      t.string :schedule, null: false

      t.timestamps
    end
  end
end
