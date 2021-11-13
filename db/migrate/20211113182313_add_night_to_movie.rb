class AddNightToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :night, :string
  end
end
