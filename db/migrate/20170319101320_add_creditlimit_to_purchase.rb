class AddCreditlimitToPurchase < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :credit_limit, :integer
    add_column :purchases, :tax_amount, :decimal, precision: 10, scale: 2
    add_column :purchases, :partial_total, :decimal, precision: 10, scale: 2
  end
end
