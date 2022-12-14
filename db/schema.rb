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

ActiveRecord::Schema.define(version: 20221120212747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "logo"
    t.boolean  "is_hidden",   default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "quantity",   default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_group_id"
    t.boolean  "is_hidden",         default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "logo"
    t.text     "description"
  end

  create_table "category_groups", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_hidden",   default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "logo"
    t.text     "description"
    t.string   "image"
  end

  create_table "colors", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string   "name"
    t.string   "symbol"
    t.float    "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "intros", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.string   "image"
    t.string   "link"
    t.boolean  "is_hidden",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "total",            default: 0
    t.integer  "user_id"
    t.string   "billing_name"
    t.string   "billing_address"
    t.string   "shipping_name"
    t.string   "shipping_address"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "token"
    t.boolean  "is_paid",          default: false
    t.string   "payment_method"
    t.string   "aasm_state",       default: "order_placed"
    t.integer  "order_id"
    t.string   "shipping_phone"
    t.string   "currency"
    t.index ["aasm_state"], name: "index_orders_on_aasm_state", using: :btree
  end

  create_table "product_color_relationships", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "color_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_images", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "image"
    t.boolean  "main_image", default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "product_lists", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "product_name"
    t.integer  "product_price"
    t.integer  "quantity"
    t.integer  "product_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "quantity"
    t.integer  "price"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "image"
    t.integer  "category_id"
    t.integer  "brand_id"
    t.boolean  "is_hidden",   default: true
    t.string   "size"
    t.string   "material"
    t.string   "country"
    t.boolean  "is_chosen",   default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "nickname"
    t.string   "address"
    t.string   "phone"
    t.date     "birthday"
    t.string   "gender"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "wish_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
