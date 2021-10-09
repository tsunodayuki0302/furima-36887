class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :telephone_number,  null: false
      t.string     :postal_code,       null: false
      t.string     :prefecture_id,     null: false
      t.string     :municipalities,    null: false
      t.string     :address,           null: false
      t.string     :building_name
      t.references :purchase_record,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
