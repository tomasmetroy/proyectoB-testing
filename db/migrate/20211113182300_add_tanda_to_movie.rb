class AddTandaToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :tanda, :string
  end
end
