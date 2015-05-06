class CreateMoneytypes < ActiveRecord::Migration
  def change
    create_table :moneytypes do |t|
      t.string :name
      t.string :znak
      t.float :curse

      t.timestamps
    end
  end
end
