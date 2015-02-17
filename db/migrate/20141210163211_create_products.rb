class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :productarticul
      t.string :distribarticul
      t.text :productname
      t.string :distributor
      t.float :pricedoll
      t.float :pricerub
      t.string :nalichie

      t.timestamps
    end
  end
end
