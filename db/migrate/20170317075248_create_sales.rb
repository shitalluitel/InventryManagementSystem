class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.integer :customer_id
      t.decimal :total, precision: 10, scale: 2
      t.string :fiscal_year
      t.date :date

      t.timestamps
    end
  end
end
