class Purchase < ApplicationRecord
  has_many :purchase_items
  accepts_nested_attributes_for :purchase_items

  belongs_to :item

end
