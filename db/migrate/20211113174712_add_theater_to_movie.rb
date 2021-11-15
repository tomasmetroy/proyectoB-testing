class AddTheaterToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :theater, :string
  end
end
