class CreateOrderparts < ActiveRecord::Migration
  def change
    create_table :orderparts do |t|
      t.string :partnum
      t.text :descr
      t.integer :qty
      t.integer :psaleprice
      t.string :distrib
      t.integer :doner_id
      t.integer :state_id
      t.integer :panswtime_id
      t.integer :rezprice
      t.integer :rezpricetype_id
      t.integer :reztime_id
      t.integer :nds
      t.integer :beznal
      t.integer :pshiptime_id
      t.integer :shipprice
      t.float :convertion
      t.integer :pmargin
      t.text :comment
      t.references :order, index: true

      t.timestamps
    end
  end
end
