class AddEstsellpriceToPurchase < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :est_sell_price, :decimal, precision: 10, scale: 2
  end
end
