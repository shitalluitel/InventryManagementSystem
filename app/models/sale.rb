class Sale < ApplicationRecord
  has_many :sale_items, :dependent => :destroy
  accepts_nested_attributes_for :sale_items, :allow_destroy => true
  belongs_to :customer

  validates :date, presence: true
  validates :bill_number, presence: true, uniqueness: true
  validates :discount, presence: true
end
