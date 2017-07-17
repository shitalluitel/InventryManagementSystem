class Vendor < ApplicationRecord
  has_many :purchases

  validates :name, presence: true, length: { maximum: 32}
  validates :address, presence: true, length: { minimum: 1, maximum: 128}
  validates :phone_no, length: {minimum: 6, maximum:14}

end
