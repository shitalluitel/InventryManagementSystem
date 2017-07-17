class CreateFiscalYears < ActiveRecord::Migration[5.0]
  def change
    create_table :fiscal_years do |t|
      t.string :name
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
