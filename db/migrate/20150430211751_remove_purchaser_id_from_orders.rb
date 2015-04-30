class RemovePurchaserIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :purchaser_id
  end
end
