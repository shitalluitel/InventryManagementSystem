class AddWardToCompanyProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :company_profiles, :ward_no, :string
  end
end
