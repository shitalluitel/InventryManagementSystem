class CreateCurrentFiscalYears < ActiveRecord::Migration[5.0]
  def change
    create_table :current_fiscal_years do |t|
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
