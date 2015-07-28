class AddArhiveToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :arhive, :bool
  end
end
