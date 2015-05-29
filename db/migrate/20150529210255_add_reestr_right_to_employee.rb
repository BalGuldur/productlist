class AddReestrRightToEmployee < ActiveRecord::Migration
  def up
    add_column :employees, :reestrright, :bool
  end
  def down
    remove_column :employees, :reestrright
  end
end
