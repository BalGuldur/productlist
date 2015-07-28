class AddReestrfileToReestrprihodovs < ActiveRecord::Migration
  def change
    add_column :reestrprihodovs, :reestrfile, :string
  end
end
