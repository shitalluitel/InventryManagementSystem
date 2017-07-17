class AddFiscalyearToPurchases < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :fiscal_year, :string
    add_column :purchases, :date, :date
  end
end
