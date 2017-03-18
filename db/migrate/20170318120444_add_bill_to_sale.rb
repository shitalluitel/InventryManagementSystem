class AddBillToSale < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :bill_number, :string
    add_column :sales, :discount, :decimal, precision: 10, scale: 2
  end
end
