# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170511104226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "company_profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "vdc_mun"
    t.string   "phone"
    t.string   "vat_pan_no"
    t.string   "district"
    t.string   "zone"
    t.string   "email"
    t.string   "website"
    t.integer  "userid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "logo"
    t.string   "ward_no"
    t.integer  "tax"
    t.string   "country"
  end

  create_table "current_fiscal_years", force: :cascade do |t|
    t.integer  "fiscal_year_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "customer_name"
    t.text     "address"
    t.string   "phone_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "fiscal_years", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["parent_id"], name: "index_item_groups_on_parent_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "unit_id"
    t.string   "item_code"
    t.integer  "item_group_id"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "logs", force: :cascade do |t|
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "purchase_items", force: :cascade do |t|
    t.integer  "purchase_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.decimal  "unit_price",  precision: 10, scale: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.decimal  "total",          precision: 10, scale: 2
    t.integer  "vendor_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "fiscal_year"
    t.date     "date"
    t.decimal  "discount",       precision: 10, scale: 2
    t.string   "bill_number"
    t.integer  "credit_limit"
    t.decimal  "tax_amount",     precision: 10, scale: 2
    t.decimal  "partial_total",  precision: 10, scale: 2
    t.decimal  "est_sell_price", precision: 10, scale: 2
  end

  create_table "sale_items", force: :cascade do |t|
    t.integer  "sale_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.decimal  "unit_price", precision: 10, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "customer_id"
    t.decimal  "total",         precision: 10, scale: 2
    t.string   "fiscal_year"
    t.date     "date"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "bill_number"
    t.decimal  "discount",      precision: 10, scale: 2
    t.integer  "credit_limit"
    t.decimal  "tax_amount",    precision: 10, scale: 2
    t.decimal  "partial_total", precision: 10, scale: 2
  end

  create_table "stocks", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "quantity"
    t.decimal  "unit_price",     precision: 10, scale: 2
    t.decimal  "est_sell_price", precision: 10, scale: 2
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.string   "print_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "first_name",             default: "", null: false
    t.string   "middle_name"
    t.string   "last_name",              default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.datetime "deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "phone_no"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
