class AddLogoToCompanyProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :company_profiles, :logo, :string
  end
end
