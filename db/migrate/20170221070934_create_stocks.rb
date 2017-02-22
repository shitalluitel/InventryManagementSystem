class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.integer :item_id
      t.integer :quantity
      t.decimal :unit_price, precision: 10, scale: 2
      t.decimal :est_sell_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
