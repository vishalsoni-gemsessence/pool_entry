class CreateEntryBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :entry_bookings do |t|
      t.references :customer, null: false, foreign_key: true
      t.float :persons
      t.float :active_persons
      t.float :amount
      t.date :date
      t.time :in_time
      t.time :out_time
      t.string :purpose
      t.text :remark
      t.references :entry_type, null: false, foreign_key: true
      t.integer :locker_token

      t.timestamps
    end
  end
end
