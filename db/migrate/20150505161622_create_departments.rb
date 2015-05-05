class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.boolean :saleright
      t.boolean :purchaserright

      t.timestamps
    end
  end
end
