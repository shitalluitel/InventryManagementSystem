class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :vender_id
      t.integer :item_id
      t.decimal :unit_cost_price
      t.integer :quantity
      t.decimal :cash_credit

      t.timestamps
    end
  end
end
