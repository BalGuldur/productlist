class RemoveAddrateFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :addrate
  end
end
