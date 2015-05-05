class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :fio
      t.integer :department_id
      t.string :intphone
      t.string :mobphone
      t.string :job
      t.string :email
      t.boolean :enable
      t.text :comment

      t.timestamps
    end
  end
end
