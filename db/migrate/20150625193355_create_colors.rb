class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :name
      t.string :hex
      t.string :if

      t.timestamps
    end
  end
end
