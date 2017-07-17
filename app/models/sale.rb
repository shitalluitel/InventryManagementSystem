class Sale < ApplicationRecord
  has_many :sale_items, :dependent => :destroy
  accepts_nested_attributes_for :sale_items, :allow_destroy => true
  belongs_to :customer

  validates :date, presence: true
  validates :bill_number, presence: true, uniqueness: true
  validates :discount, presence: true

  def self.search(start_date, end_date)
    if start_date.present? and end_date.presrnt?
      d, m, y = start_date.split('-')
      if Date.valid_date? y.to_i, m.to_i, d.to_i
        where("date >= ? and date <= ? ",start_date, end_date).order("date ASC")
      end
      if start_date.present? and end_date.nil?
        joins(:customer).where("lower(name) like ?", "%#{start_date.downcase}%")
      end
    else
      all
    end
  end

  def self.SaleSearch(start,last)
    if start.present? && last.present?
      where("date >= ? and date <= ? ",start, last).order("date ASC")
    else
      all
    end
  end
end
