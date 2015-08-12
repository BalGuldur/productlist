class CreateZakupkaparts < ActiveRecord::Migration
  def change
    create_table :zakupkaparts do |t|
      t.string :partnum
      t.text :descr
      t.integer :qty
      t.integer :psaleprice
      t.integer :doner_id
      t.integer :state_id
      t.float :rezprice
      t.integer :rezpricetype_id
      t.integer :nds
      t.integer :beznal
      t.integer :pshiptime_id
      t.integer :shipprice
      t.float :convertion
      t.integer :pmargin
      t.text :comment
      t.integer :order_id
      t.integer :distributor_id
      t.string :idorddistrib

      t.timestamps
    end
  end
end
