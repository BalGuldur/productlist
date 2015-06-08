class AddPurchaserToOrders < ActiveRecord::Migration
  def up
    add_column :orders, :purchaser, :string
  end
  def down
    remove_column :orders, :purchaser
  end
end
