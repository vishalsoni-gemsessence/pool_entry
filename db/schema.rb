# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_24_154930) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.string "contact_number", null: false
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "earnings", force: :cascade do |t|
    t.date "date"
    t.float "total_entries"
    t.float "total_persons"
    t.float "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entry_bookings", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.float "persons"
    t.float "active_persons"
    t.float "amount"
    t.date "date"
    t.time "in_time"
    t.time "out_time"
    t.string "purpose"
    t.text "remark"
    t.bigint "entry_type_id", null: false
    t.integer "locker_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_entry_bookings_on_customer_id"
    t.index ["entry_type_id"], name: "index_entry_bookings_on_entry_type_id"
  end

  create_table "entry_types", force: :cascade do |t|
    t.string "entry_type"
    t.float "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "entry_bookings", "customers"
  add_foreign_key "entry_bookings", "entry_types"
end
