class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :customer_name
      t.text :address
      t.string :phone_number

      t.timestamps
    end
  end
end
