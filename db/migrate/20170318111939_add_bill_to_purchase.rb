class AddBillToPurchase < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :bill_number, :string
  end
end
