class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :vender_id
      t.integer :item_id
      t.decimal :unit_cost_price, precision: 10, scale: 2
      t.integer :quantity
      t.decimal :cash_credit, precision: 10, scale: 2

      t.timestamps
    end
  end
end
