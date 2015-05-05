class CreateOrderstates < ActiveRecord::Migration
  def change
    create_table :orderstates do |t|
      t.string :state
      t.string :color

      t.timestamps
    end
  end
end
