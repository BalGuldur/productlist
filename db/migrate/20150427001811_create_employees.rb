class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :fio
      t.integer :department_id
      t.string :phone
      t.string :mobphone
      t.string :email
      t.string :job

      t.timestamps
    end
  end
end
