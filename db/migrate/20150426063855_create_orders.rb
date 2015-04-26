class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :manager_id
      t.integer :numbill
      t.integer :purchaser_id
      t.integer :shipprice
      t.integer :addrate
      t.string :datetimedone
      t.integer :margin
      t.integer :statereser_id
      t.text :comments

      t.timestamps
    end
  end
end
