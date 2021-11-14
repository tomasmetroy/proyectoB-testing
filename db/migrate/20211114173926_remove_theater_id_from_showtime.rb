class RemoveTheaterIdFromShowtime < ActiveRecord::Migration[6.1]
  def change
    remove_column :showtimes, :theater_id, :string
  end
end
