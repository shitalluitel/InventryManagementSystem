class ItemGroup < ApplicationRecord
  has_many :children, class_name: "ItemGroup", foreign_key: "parent_id", dependent: :destroy
  belongs_to :parent, class_name: "ItemGroup", optional: true

  has_many :items, dependent: :destroy

  validates :name, presence: true, length: {minimum: 3, maximum: 32}
  validates :description, presence: true, length: {minimum: 10, maximum: 256}
end
