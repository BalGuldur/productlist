class Changetyperezprice < ActiveRecord::Migration
  def up
    change_column :orderparts, :rezprice, :float
  end
  def down
    change_column :orderparts, :rezprice, :integer
  end
end
