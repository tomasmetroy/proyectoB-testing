class AddTheaterToShowtime < ActiveRecord::Migration[6.1]
  def change
    add_column :showtimes, :theater, :string
  end
end
