class CreateEntryTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :entry_types do |t|
      t.string :entry_type
      t.float :rate

      t.timestamps
    end
  end
end
