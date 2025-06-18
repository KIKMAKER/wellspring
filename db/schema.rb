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

ActiveRecord::Schema[7.1].define(version: 2025_06_18_094205) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deliveries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "delivery_day_id", null: false
    t.boolean "paid"
    t.boolean "bundle"
    t.boolean "completed"
    t.datetime "delivered_at"
    t.string "customer_note"
    t.bigint "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_day_id"], name: "index_deliveries_on_delivery_day_id"
    t.index ["payment_id"], name: "index_deliveries_on_payment_id"
    t.index ["user_id"], name: "index_deliveries_on_user_id"
  end

  create_table "delivery_days", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date"
    t.integer "capacity", default: 20
    t.integer "filled_slots", default: 0
    t.integer "start_kms"
    t.integer "end_kms"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_delivery_days_on_user_id"
  end

  create_table "invoice_items", force: :cascade do |t|
    t.bigint "invoice_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_items_on_invoice_id"
    t.index ["product_id"], name: "index_invoice_items_on_product_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.date "issued_date"
    t.date "due_date"
    t.integer "number"
    t.float "total_amount"
    t.boolean "status", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "snapscan_id"
    t.string "status"
    t.integer "total_amount"
    t.integer "tip_amount"
    t.integer "fee_amount"
    t.integer "settle_amount"
    t.datetime "paid_at"
    t.string "user_reference"
    t.string "merchant_reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "phone_number"
    t.string "secondary_phone_number"
    t.string "address"
    t.integer "role", default: 0
    t.datetime "container_paid_at"
    t.string "customer_id"
    t.float "latitude"
    t.float "longitude"
    t.string "suburb"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "deliveries", "delivery_days"
  add_foreign_key "deliveries", "payments"
  add_foreign_key "deliveries", "users"
  add_foreign_key "delivery_days", "users"
  add_foreign_key "invoice_items", "invoices"
  add_foreign_key "invoice_items", "products"
  add_foreign_key "invoices", "users"
  add_foreign_key "payments", "users"
end
