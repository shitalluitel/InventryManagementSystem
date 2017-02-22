class Item < ApplicationRecord
  validates :name, presence: true
  has_one :stock,inverse_of: :item, :dependent => :destroy
  accepts_nested_attributes_for :stock

  belongs_to :unit
  belongs_to :item_group
end
