class Stock < ApplicationRecord
  belongs_to :item, required: false

  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :unit_price, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :est_sell_price, presence: true, numericality: {greater_than_or_equal_to: 0}
end
