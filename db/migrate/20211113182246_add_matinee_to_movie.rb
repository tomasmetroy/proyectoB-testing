class AddMatineeToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :matinee, :string, array: true, default: []
  end
end
