class CreateIntproducts < ActiveRecord::Migration
  def change
    create_table :intproducts do |t|
      t.string :name
      t.string :partnumber
      t.string :serialnumber
      t.integer :prodtype_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
