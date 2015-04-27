class AddDonerToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :doner_id, :integer
  end
end
