class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :user, null: false
      t.string :row, null: false
      t.string :seat, null: false
      t.references :showtime, null: false, foreign_key: true
      t.timestamps
    end
  end
end
