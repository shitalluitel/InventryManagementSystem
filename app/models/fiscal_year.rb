class FiscalYear < ApplicationRecord
  has_one :current_fiscal_year

  validates :name, presence: true
  validates :start_date, :if => :start_validates?, presence: true
  validates :end_date, presence: true

  def start_validates?
    if start_date.present? && end_date.present?
      unless start_date < end_date
        self.errors.add(:start_date, "is gretter then End date.")
      end
    else
      self.errors
    end
  end

end
