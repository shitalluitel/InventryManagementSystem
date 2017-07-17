class CreateItemGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :item_groups do |t|
      t.string :name
      t.integer :parent_id
      t.text :description
      t.references :parent, index: true

      t.timestamps
    end
  end
end
