class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :card_number  ,null: false
      t.integer :month  ,null: false
      t.integer :year  ,null: false
      t.integer :security_code  ,null: false
      t.string :postal_cord   ,null: false
      t.integer :prefecture_id,null: false
      t.string :municipality,null: false
      t.string :address,null: false
      t.string :buildingname
      t.string :phone_number,null: false
      t.timestamps
    end
  end
end