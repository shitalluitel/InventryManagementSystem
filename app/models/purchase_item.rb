class PurchaseItem < ApplicationRecord
  belongs_to :purchase, required: false
  belongs_to :item
  # validates :quantity, presence: true, :numericality => { :greater_than => 0 }
  # validates :unit_price, presence: true
  # validates :item_id, presence: true
end
