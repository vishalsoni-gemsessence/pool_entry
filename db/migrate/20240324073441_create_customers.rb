class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :contact_number, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
