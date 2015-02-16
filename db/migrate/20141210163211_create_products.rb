class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :productarticul
      t.text :productname
      t.string :distributor
      t.float :price
      t.string :nalichie

      t.timestamps
    end
  end
end
