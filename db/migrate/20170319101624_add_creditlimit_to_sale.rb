class AddCreditlimitToSale < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :credit_limit, :integer
    add_column :sales, :tax_amount, :decimal, precision: 10, scale: 2
    add_column :sales, :partial_total, :decimal, precision: 10, scale: 2
  end
end
