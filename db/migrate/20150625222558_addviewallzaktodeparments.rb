class Addviewallzaktodeparments < ActiveRecord::Migration
  def up
    add_column :departments, :viewallord, :boolean
  end
  def down
    remove_column :departments, :viewallord
  end
end
