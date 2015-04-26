class CreateOrderparts < ActiveRecord::Migration
  def change
    create_table :orderparts do |t|
      t.string :partnumber
      t.text :partdescr
      t.integer :qty
      t.float :pricesell
      t.float :priceship
      t.string :shipper
      t.integer :beznal
      t.float :convert
      t.string :predatetime
      t.string :faktdatetime
      t.integer :statereserv_id
      t.integer :nds

      t.timestamps
    end
  end
end
