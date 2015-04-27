class CreatePurchasers < ActiveRecord::Migration
  def change
    create_table :purchasers do |t|
      t.string :name
      t.string :fio
      t.string :phone
      t.integer :employee_id

      t.timestamps
    end
  end
end
