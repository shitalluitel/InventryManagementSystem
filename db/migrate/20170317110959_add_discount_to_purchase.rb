class AddDiscountToPurchase < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :discount, :decimal, precision: 10, scale: 2
  end
end
