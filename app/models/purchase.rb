class Purchase < ApplicationRecord
  has_many :purchase_items, :dependent => :destroy
  accepts_nested_attributes_for :purchase_items, :allow_destroy => true
  belongs_to :vendor

  validates :date, presence: true
  validates :bill_number, presence: true, uniqueness: true
  validates :discount, presence: true
end
