class CreateEarnings < ActiveRecord::Migration[7.1]
  def change
    create_table :earnings do |t|
      t.date :date
      t.float :total_entries
      t.float :total_persons
      t.float :total_amount

      t.timestamps
    end
  end
end
