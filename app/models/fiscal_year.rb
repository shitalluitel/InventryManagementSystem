class FiscalYear < ApplicationRecord
  has_one :current_fiscal_year

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
