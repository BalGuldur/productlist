class AddReestrfileToReestrotgruzoks < ActiveRecord::Migration
  def change
    add_column :reestrotgruzoks, :reestrfile, :string
  end
end
