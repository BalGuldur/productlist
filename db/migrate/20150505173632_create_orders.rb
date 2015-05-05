class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :numbill
      t.integer :manager_id
      t.integer :doner_id
      t.integer :orderstate_id
      t.integer :addrate
      t.integer :sum
      t.integer :pmargin
      t.text :comment

      t.timestamps
    end
  end
end
