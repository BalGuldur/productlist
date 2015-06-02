class AddNumsfakturToReestrotgruzoks < ActiveRecord::Migration
  def up
    add_column :reestrotgruzoks, :numsfaktur, :string
  end
  def down
    remove_column :reestrotgruzoks, :numsfaktur
  end
end
