class Unit < ApplicationRecord
  has_many :items

  validates :name, presence: true, length: {minimum: 2, maximum: 32}
  validates :print_name, presence: true, length: {minimum: 2, maximum: 32}

end
