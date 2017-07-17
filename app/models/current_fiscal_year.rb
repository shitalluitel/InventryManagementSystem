class CurrentFiscalYear < ApplicationRecord
  belongs_to :fiscal_year

  validates :fiscal_year_id, presence: true
end
