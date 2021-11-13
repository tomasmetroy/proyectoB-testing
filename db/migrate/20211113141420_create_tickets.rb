class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :user
      t.string :row
      t.string :column
      t.references :showtime, null: false, foreign_key: true

      t.timestamps
    end
  end
end
