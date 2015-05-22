class AddIdorddistribToOrderparts < ActiveRecord::Migration
  def up
    add_column :orderparts, :idorddistrib, :string
  end
  def down
    remove_column :orderparts, :idorddistrib
  end
end
