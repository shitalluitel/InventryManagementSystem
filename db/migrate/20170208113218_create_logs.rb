class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
