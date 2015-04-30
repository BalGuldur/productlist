class RemovePurchaserIdFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :purchaser_id
  end
  def down
    add_column :orders, :puchaser_id, :integer
  end
end
