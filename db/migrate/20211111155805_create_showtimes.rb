class CreateShowtimes < ActiveRecord::Migration[6.1]
  def change
    create_table :showtimes do |t|

      t.timestamps
    end
  end
end
