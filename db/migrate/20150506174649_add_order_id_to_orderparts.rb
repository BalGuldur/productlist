class AddOrderIdToOrderparts < ActiveRecord::Migration
  def up
    add_column :orderparts, :order_id, :integer
  end
  def down
    remove_column :orderparts, :order_id
  end
end
