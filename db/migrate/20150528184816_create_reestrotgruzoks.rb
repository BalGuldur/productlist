class CreateReestrotgruzoks < ActiveRecord::Migration
  def change
    create_table :reestrotgruzoks do |t|
      t.string :kontragent
      t.string :numbill
      t.string :numotgruzdoc
      t.date :sendtoclient
      t.date :resievedate
      t.date :sendtobuh

      t.timestamps
    end
  end
end
