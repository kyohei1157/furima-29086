class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :category        , null: false
      t.string       :status         , null: false
      t.string    :shipping_fee_burden     , null: false
      t.string     :shipping_area        , null: false
      t.date     :days_to_ship        , null: false
      t.timestamps
    end
  end
end
