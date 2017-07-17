class AddCountryToCompanyProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :company_profiles, :country, :string
  end
end
