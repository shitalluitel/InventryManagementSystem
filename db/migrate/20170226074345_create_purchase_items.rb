class CreatePurchaseItems < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_items do |t|
      t.integer :purchase_id
      t.integer :item_id
      t.integer :quantity
      t.decimal :unit_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
