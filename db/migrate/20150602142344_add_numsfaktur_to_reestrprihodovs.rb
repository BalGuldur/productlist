class AddNumsfakturToReestrprihodovs < ActiveRecord::Migration
  def up
    add_column :reestrprihodovs, :numsfaktur, :string
  end
  def down
    remove_column :reestrprihodovs, :numsfaktur
  end
end
