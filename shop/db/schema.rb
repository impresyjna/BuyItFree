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

ActiveRecord::Schema.define(version: 20150920183038) do

  create_table "baskets", force: :cascade do |t|
    t.integer  "user_id"
    t.float    "total_price"
    t.integer  "total_count"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "baskets", ["user_id"], name: "index_baskets_on_user_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "title"
    t.string   "message"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "respond"
  end

  add_index "contacts", ["user_id", "created_at"], name: "index_contacts_on_user_id_and_created_at"
  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id"

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "address"
    t.string   "post_code"
    t.string   "city"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "telephone"
  end

  add_index "customers", ["user_id", "created_at"], name: "index_customers_on_user_id_and_created_at"
  add_index "customers", ["user_id"], name: "index_customers_on_user_id"

  create_table "goods", force: :cascade do |t|
    t.string   "title"
    t.float    "price"
    t.string   "description"
    t.integer  "how_many"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "user_id"
    t.integer  "category_id"
  end

  add_index "goods", ["category_id", "created_at"], name: "index_goods_on_category_id_and_created_at"
  add_index "goods", ["category_id"], name: "index_goods_on_category_id"
  add_index "goods", ["user_id", "created_at"], name: "index_goods_on_user_id_and_created_at"
  add_index "goods", ["user_id"], name: "index_goods_on_user_id"

  create_table "order_items", force: :cascade do |t|
    t.integer  "basket_id"
    t.integer  "user_id"
    t.integer  "good_id"
    t.integer  "how_many"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
  end

  add_index "order_items", ["basket_id"], name: "index_order_items_on_basket_id"
  add_index "order_items", ["good_id"], name: "index_order_items_on_good_id"
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"
  add_index "order_items", ["user_id"], name: "index_order_items_on_user_id"

  create_table "order_states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "order_state_id"
    t.integer  "customer_id"
    t.integer  "seller_id"
    t.float    "total_price"
    t.integer  "total_count"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "send_way_id"
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"
  add_index "orders", ["order_state_id"], name: "index_orders_on_order_state_id"
  add_index "orders", ["seller_id"], name: "index_orders_on_seller_id"
  add_index "orders", ["send_way_id"], name: "index_orders_on_send_way_id"

  create_table "sellers", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "address"
    t.string   "post_code"
    t.string   "city"
    t.string   "account_number"
    t.string   "company_name"
    t.string   "company_address"
    t.string   "company_post_code"
    t.string   "company_city"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "telephone"
    t.string   "company_number"
    t.float    "rate"
  end

  add_index "sellers", ["user_id", "created_at"], name: "index_sellers_on_user_id_and_created_at"
  add_index "sellers", ["user_id"], name: "index_sellers_on_user_id"

  create_table "send_ways", force: :cascade do |t|
    t.string   "name"
    t.integer  "good_id"
    t.integer  "how_many_days"
    t.float    "price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "send_ways", ["good_id"], name: "index_send_ways_on_good_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "remember_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "account_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
