class ItemGroup < ApplicationRecord
  has_many :children, class_name: "ItemGroup", foreign_key: "parent_id", dependent: :destroy
  belongs_to :parent, class_name: "ItemGroup", optional: true
end
