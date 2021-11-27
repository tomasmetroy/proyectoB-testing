class AddIndexToTicket < ActiveRecord::Migration[6.1]
  def change
    add_index :tickets, [:row, :seat, :showtime_id], unique: true
    #Ex:- add_index("admin_users", "username")
  end
end
