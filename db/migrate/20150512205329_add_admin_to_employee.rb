class AddAdminToEmployee < ActiveRecord::Migration
  def up
    add_column :employees, :admin, :boolean
  end
  def down
    remove_column :employees, :admin
  end
end
