class PurchaseItem < ApplicationRecord
  belongs_to :purchase

  validates :quantity, presence: true, :numericality => { :greater_than => 0 }
  validates :unit_price, presence: true
end
