class RemoveShippriceFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :shipprice
  end
  def down
    add_column :orders, :shipprice, :integer
  end
end
