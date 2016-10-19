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

ActiveRecord::Schema.define(version: 20140919022412) do

  create_table "accessories", force: :cascade do |t|
    t.string   "short_code",     limit: 255
    t.string   "brand",          limit: 255
    t.string   "name",           limit: 255
    t.string   "catalog",        limit: 255
    t.string   "info",           limit: 255
    t.decimal  "price"
    t.integer  "title_photo_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "product_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "title",      limit: 255
    t.string   "mobile",     limit: 255
    t.string   "phone",      limit: 255
    t.string   "email",      limit: 255
    t.string   "qq",         limit: 255
    t.string   "address",    limit: 255
    t.integer  "level",                  default: 0
    t.string   "info",       limit: 255
    t.string   "reason",     limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "customers_manufactories", id: false, force: :cascade do |t|
    t.integer "manufactory_id"
    t.integer "customer_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname",               limit: 255
    t.string   "roles",                  limit: 255
    t.integer  "default_shop_id"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "employees_issues", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "issue_id"
  end

  create_table "godown_entries", force: :cascade do |t|
    t.date     "godown_date"
    t.integer  "manufactory_id"
    t.integer  "from_warehouse_id"
    t.integer  "to_warehouse_id"
    t.string   "info",              limit: 255
    t.integer  "total_quantity",                default: 0
    t.integer  "operator"
    t.integer  "status",                        default: 0
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "godown_items", force: :cascade do |t|
    t.integer  "godown_entry_id"
    t.string   "product_data_type", limit: 255
    t.integer  "product_data_id"
    t.integer  "quantity",                                              default: 0
    t.integer  "status",                                                default: 0
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
    t.decimal  "cost",                          precision: 8, scale: 2, default: "0.0"
    t.integer  "product_id"
  end

  create_table "guitars", force: :cascade do |t|
    t.string   "brand",          limit: 255
    t.string   "guitar_type",    limit: 255
    t.string   "model",          limit: 255
    t.decimal  "price"
    t.string   "info",           limit: 255
    t.integer  "title_photo_id"
    t.integer  "status",                     default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "short_code",     limit: 255
    t.integer  "product_id"
  end

  create_table "issues", force: :cascade do |t|
    t.string   "description",    limit: 255
    t.datetime "due_date"
    t.integer  "employee_id"
    t.integer  "status",                     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "manufactory_id"
  end

  create_table "manufactories", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "address",      limit: 255
    t.string   "website",      limit: 255
    t.string   "phone",        limit: 255
    t.string   "email",        limit: 255
    t.string   "bank_account", limit: 255
    t.string   "contact",      limit: 255
    t.decimal  "rating"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "biz_type",     limit: 255
    t.string   "factory_type", limit: 255
  end

  create_table "notes", force: :cascade do |t|
    t.string   "notes_data_type", limit: 255
    t.integer  "notes_data_id"
    t.string   "notes_text",      limit: 255
    t.integer  "employee_id"
    t.integer  "status",                      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "photo_data_type",  limit: 255
    t.integer  "photo_data_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "pic_file_name",    limit: 255
    t.string   "pic_content_type", limit: 255
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  create_table "product_prices", force: :cascade do |t|
    t.integer  "product_id"
    t.decimal  "price"
    t.integer  "godown_count",  default: 0
    t.decimal  "godown_amount", default: "0.0"
    t.decimal  "godown_fee",    default: "0.0"
    t.decimal  "godown_price",  default: "0.0"
    t.integer  "status",        default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "product_specifications", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "specification_id"
    t.string   "spec_text",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: :cascade do |t|
    t.string   "brand",          limit: 255
    t.string   "model",          limit: 255
    t.string   "full_name",      limit: 255
    t.string   "catalog",        limit: 255
    t.integer  "title_photo_id"
    t.integer  "status",                     default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "short_name",     limit: 255
  end

  create_table "sales_sheet_items", force: :cascade do |t|
    t.integer  "sales_sheet_id"
    t.string   "product_data_type", limit: 255
    t.integer  "product_data_id"
    t.integer  "quantity",                                              default: 0
    t.decimal  "price",                         precision: 8, scale: 2, default: "0.0"
    t.decimal  "amount",                        precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
    t.string   "description",       limit: 255
    t.integer  "serial_product_id"
    t.string   "serial_number",     limit: 255
    t.integer  "product_id"
    t.decimal  "actual_amount"
  end

  create_table "sales_sheets", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "warehouse_id"
    t.integer  "operator_id"
    t.integer  "total_items",                                        default: 0
    t.decimal  "total_amount",               precision: 8, scale: 2, default: "0.0"
    t.decimal  "additional_fee",             precision: 8, scale: 2, default: "0.0"
    t.decimal  "discount",                   precision: 8, scale: 2, default: "0.0"
    t.decimal  "actual_amount",              precision: 8, scale: 2, default: "0.0"
    t.integer  "status",                                             default: 0
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.string   "info",           limit: 255
    t.decimal  "discount_rate"
  end

  create_table "serial_products", force: :cascade do |t|
    t.string   "serial_number",       limit: 255
    t.string   "product_name",        limit: 255
    t.string   "product_model",       limit: 255
    t.integer  "title_photo_id"
    t.integer  "production_batch_id"
    t.string   "product_data_type",   limit: 255
    t.integer  "product_data_id"
    t.integer  "status",                          default: 0
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "stock_id"
    t.integer  "product_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255, null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "specifications", force: :cascade do |t|
    t.integer  "show_order"
    t.string   "spec_title", limit: 255
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "static_reports", force: :cascade do |t|
    t.integer  "report_num"
    t.integer  "row"
    t.integer  "col"
    t.string   "val"
    t.integer  "report_type", default: 0
    t.integer  "status",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_journals", force: :cascade do |t|
    t.integer  "stock_id"
    t.integer  "stock_before"
    t.integer  "stock_change"
    t.integer  "stock_after"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "stock_order_type", limit: 255
    t.integer  "stock_order_id"
    t.integer  "product_id"
  end

  create_table "stock_taking_items", force: :cascade do |t|
    t.integer  "stock_taking_id"
    t.string   "product_data_type", limit: 255
    t.integer  "product_data_id"
    t.string   "full_name",         limit: 255
    t.string   "catalog",           limit: 255
    t.integer  "on_hand",                       default: 0
    t.integer  "quantity",                      default: 0
    t.integer  "status",                        default: 0
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "product_id"
  end

  create_table "stock_takings", force: :cascade do |t|
    t.integer  "warehouse_id"
    t.string   "info",         limit: 255
    t.integer  "status",                   default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string   "product_data_type", limit: 255
    t.integer  "product_data_id"
    t.integer  "on_hand",                       default: 0
    t.string   "info",              limit: 255
    t.integer  "title_photo_id"
    t.date     "last_buy_date"
    t.date     "sold_out_date"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "warehouse_id"
    t.integer  "product_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "pre_code",   limit: 255
    t.integer  "status",                 default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

end
