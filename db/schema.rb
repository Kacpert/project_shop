# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150129183831) do

  create_table "articles", force: true do |t|
    t.string   "name",       limit: 50, null: false
    t.datetime "created_at",            null: false
    t.text     "content",               null: false
    t.text     "content_pl",            null: false
  end

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string "name", limit: 20, null: false
  end

  create_table "customers", force: true do |t|
    t.string   "name",              limit: 20,                  null: false
    t.string   "last_name",         limit: 50,                  null: false
    t.string   "email",             limit: 80,                  null: false
    t.string   "password_digest",   limit: 128,                 null: false
    t.integer  "phone",                                         null: false
    t.datetime "created_at",                                    null: false
    t.boolean  "active",                        default: false, null: false
    t.string   "zip_code",          limit: 6,                   null: false
    t.string   "city",              limit: 50,                  null: false
    t.string   "address",           limit: 50,                  null: false
    t.string   "activation_digest"
    t.boolean  "activated",                     default: false
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "customers", ["email"], name: "email", unique: true, using: :btree
  add_index "customers", ["email"], name: "index_customers_on_email", unique: true, using: :btree

  create_table "favorites", force: true do |t|
    t.integer  "product_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["customer_id"], name: "index_favorites_on_customer_id", using: :btree
  add_index "favorites", ["product_id"], name: "index_favorites_on_product_id", using: :btree

  create_table "line_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",   default: 1
    t.string   "size"
    t.string   "color"
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "newsletters", force: true do |t|
    t.string "email", limit: 40, null: false
  end

  create_table "orders", force: true do |t|
    t.integer  "customer_id",                  null: false
    t.datetime "created_at",                   null: false
    t.text     "product_id",                   null: false
    t.text     "product_amount",               null: false
    t.text     "product_option",               null: false
    t.text     "product_color",                null: false
    t.text     "product_price",                null: false
    t.float    "shipping_price",    limit: 24, null: false
    t.string   "shipping",          limit: 30, null: false
    t.string   "order_currency",    limit: 3,  null: false
    t.string   "status",            limit: 20, null: false
    t.string   "shipping_zip_code", limit: 6,  null: false
    t.string   "shipping_city",     limit: 30, null: false
    t.string   "shipping_address",  limit: 30, null: false
  end

  add_index "orders", ["id"], name: "id", using: :btree

  create_table "products", force: true do |t|
    t.string  "name",           limit: 30,                         null: false
    t.decimal "price_pln",                 precision: 9, scale: 2, null: false
    t.decimal "price_eur",                 precision: 9, scale: 2, null: false
    t.decimal "price_gbp",                 precision: 9, scale: 2, null: false
    t.integer "weight",                                            null: false
    t.text    "photos",                                            null: false
    t.text    "options",                                           null: false
    t.text    "description_pl",                                    null: false
    t.text    "description_en",                                    null: false
    t.text    "color",                                             null: false
    t.integer "category_id",                                       null: false
  end

  add_index "products", ["id"], name: "id", using: :btree
  add_index "products", ["id"], name: "id_2", using: :btree

  create_table "shippings", force: true do |t|
    t.string  "name",      limit: 20,                         null: false
    t.decimal "price_pln",            precision: 9, scale: 2, null: false
    t.decimal "price_eur",            precision: 9, scale: 2, null: false
    t.decimal "price_gbp",            precision: 9, scale: 2, null: false
  end

  create_table "sliders", force: true do |t|
    t.string "title_pl",    limit: 15,  null: false
    t.string "subtitle_pl", limit: 100, null: false
    t.string "title_en",    limit: 15,  null: false
    t.string "subtitle_en", limit: 100, null: false
    t.string "img",                     null: false
  end

  create_table "status", force: true do |t|
    t.string "name", limit: 15, null: false
  end

  create_table "users", force: true do |t|
    t.string "username",     limit: 20,  null: false
    t.string "password",     limit: 128, null: false
    t.string "auth_key",     limit: 128, null: false
    t.string "access_token", limit: 128, null: false
  end

end
