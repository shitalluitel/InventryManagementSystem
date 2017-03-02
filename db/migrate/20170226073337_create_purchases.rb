class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.decimal :total, precision: 10, scale: 2
      t.integer :vendor_id

      t.timestamps
    end
  end
end
