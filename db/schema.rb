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

ActiveRecord::Schema.define(version: 20180104015049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "designs", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.datetime "due_date"
    t.string   "price_range"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "status",      default: 0
  end

  add_index "designs", ["user_id"], name: "index_designs_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string  "username"
    t.string  "password_digest"
    t.integer "role"
    t.string  "token"
    t.string  "token_expiration"
  end

end
