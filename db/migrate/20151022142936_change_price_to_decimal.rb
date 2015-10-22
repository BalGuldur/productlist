class ChangePriceToDecimal < ActiveRecord::Migration
  def change
    change_column :orderparts, :rezprice, :decimal, precision: 10, scale: 2 
  end
end
