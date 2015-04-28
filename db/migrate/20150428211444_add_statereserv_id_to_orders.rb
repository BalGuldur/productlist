class AddStatereservIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :statereserv_id, :integer
  end
end
