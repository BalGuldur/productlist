class CreateOurtimes < ActiveRecord::Migration
  def change
    create_table :ourtimes do |t|
      t.string :name
      t.boolean :rez
      t.boolean :answ
      t.boolean :ship

      t.timestamps
    end
  end
end
