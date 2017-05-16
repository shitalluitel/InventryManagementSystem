class Purchase < ApplicationRecord
  has_many :purchase_items, :dependent => :destroy
  accepts_nested_attributes_for :purchase_items, :allow_destroy => true
  belongs_to :vendor

  validates :date, presence: true
  validates :bill_number, presence: true, uniqueness: true
  validates :discount, presence: true

  def self.search(about,start_date, end_date,vendor_name)
    if about === "Date"
      where("date >= ? and date <= ? ",start_date, end_date).order("date ASC")
    else
      if vendor_name.present?
        joins(:vendor).where("lower(name) like ?", "%#{vendor_name.downcase}%")
      else
        all
      end
    end
  end

  def self.PurchaseSearch(start_date,last_date)
    if start_date.present? && last_date.present?
      where("date >= ? and date <= ? ",start_date, last_date).order("date ASC")
    else
      where("date >= ? and date <= ?", Date.today - 30, Date.today).order("date ASC")
    end
  end
end
