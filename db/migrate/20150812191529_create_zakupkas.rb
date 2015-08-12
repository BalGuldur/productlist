class CreateZakupkas < ActiveRecord::Migration
  def change
    create_table :zakupkas do |t|
      t.string :numbill
      t.integer :manager_id
      t.integer :doner_id
      t.integer :zakupkastate_id
      t.integer :addrate
      t.integer :sum
      t.integer :margin
      t.text :comment
      t.boolean :arhive

      t.timestamps
    end
  end
end
