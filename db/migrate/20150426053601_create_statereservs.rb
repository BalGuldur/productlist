class CreateStatereservs < ActiveRecord::Migration
  def change
    create_table :statereservs do |t|
      t.string :status
      t.string :color

      t.timestamps
    end
  end
end
