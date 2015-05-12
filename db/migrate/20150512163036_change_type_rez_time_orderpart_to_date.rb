class ChangeTypeRezTimeOrderpartToDate < ActiveRecord::Migration
  def up
    remove_column :orderparts, :reztime_id
    add_column :orderparts, :reztime, :date
  end
  def down
    remove_column :orderparts, :reztime
    add_column :orderparts, :reztime_id, :integer
  end
end
