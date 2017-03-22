class AddTaxToCompanyProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :company_profiles, :tax, :integer
  end
end
