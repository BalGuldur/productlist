class CreateReestrprihodovs < ActiveRecord::Migration
  def change
    create_table :reestrprihodovs do |t|
      t.string :kontragent
      t.string :numbill
      t.string :numprihoddoc
      t.date :prihoddate
      t.date :sendwithpech
      t.date :givetoruk
      t.date :givetobuh

      t.timestamps
    end
  end
end
