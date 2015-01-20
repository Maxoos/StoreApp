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

ActiveRecord::Schema.define(version: 20150106204209) do

  create_table "assets", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry", using: :btree
  add_index "categories", ["slug"], name: "index_categories_on_cached_slug", using: :btree

  create_table "categories_products", id: false, force: true do |t|
    t.integer "product_id"
    t.integer "category_id"
  end

  create_table "effects", force: true do |t|
    t.string   "name"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "shop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "products", ["shop_id"], name: "index_products_on_shop_id", using: :btree
  add_index "products", ["slug"], name: "index_products_on_cached_slug", using: :btree

  create_table "shops", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shops", ["user_id"], name: "index_shops_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "user_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_cached_slug", using: :btree

end
