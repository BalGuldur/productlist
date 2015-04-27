class CreateProdtypes < ActiveRecord::Migration
  def change
    create_table :prodtypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
