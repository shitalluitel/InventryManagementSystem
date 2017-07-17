class Customer < ApplicationRecord
  validates :customer_name, presence: true, length: { maximum: 32}, :uniqueness => {case_sensitive: false}
  validates :address, presence: true, length: { maximum: 128}
  validates :phone_number, length: {minimum: 6, maximum:14}
end
