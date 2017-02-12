class CreateCompanyProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :company_profiles do |t|
      t.string :name
      t.string :address
      t.string :vdc_mun
      t.string :phone
      t.string :vat_pan_no
      t.string :district
      t.string :zone
      t.string :email
      t.string :website
      t.integer :userid

      t.timestamps
    end
  end
end
