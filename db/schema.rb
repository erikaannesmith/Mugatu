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

ActiveRecord::Schema.define(version: 20180111162054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: true do |t|
    t.integer "status",          default: 0
    t.text    "production_plan"
    t.float   "price"
    t.integer "user_id"
    t.integer "design_id"
    t.date    "due_date"
  end

  add_index "applications", ["design_id"], name: "index_applications_on_design_id", using: :btree
  add_index "applications", ["user_id"], name: "index_applications_on_user_id", using: :btree

  create_table "designs", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "price_range"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "status",      default: 0
    t.string   "image"
    t.date     "due_date"
  end

  add_index "designs", ["user_id"], name: "index_designs_on_user_id", using: :btree

  create_table "orders", force: true do |t|
    t.integer  "design_id"
    t.integer  "application_id"
    t.float    "price"
    t.text     "production_plan"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",          default: 0
    t.integer  "designer_id"
    t.integer  "producer_id"
    t.date     "due_date"
  end

  add_index "orders", ["application_id"], name: "index_orders_on_application_id", using: :btree
  add_index "orders", ["design_id"], name: "index_orders_on_design_id", using: :btree

  create_table "ratings", force: true do |t|
    t.integer "efficiency"
    t.integer "accuracy"
    t.integer "order_id"
  end

  add_index "ratings", ["order_id"], name: "index_ratings_on_order_id", using: :btree

  create_table "users", force: true do |t|
    t.string  "username"
    t.string  "password_digest"
    t.integer "role"
    t.string  "token"
    t.string  "token_expiration"
    t.string  "name"
    t.string  "phone_number"
    t.string  "address"
    t.string  "city"
    t.string  "state"
    t.string  "postal_code"
    t.string  "country_code",     default: "US"
  end

end
