class RemoveTheaterFromMovie < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :theater, :string
  end
end
