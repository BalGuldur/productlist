class DelOrderDistribAddOrdreDistribId < ActiveRecord::Migration
  def up
    remove_column :orderparts, :distrib
    add_reference :orderparts, :distributor
  end
  def down
    remove_column :orderparts, :distributor_id
    add_column :orderparts, :distrib, :string
  end
end
