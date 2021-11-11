class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :username
      t.string :column
      t.string :row

      t.timestamps
    end
  end
end
