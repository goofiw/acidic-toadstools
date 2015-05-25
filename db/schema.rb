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

ActiveRecord::Schema.define(version: 20150525020836) do

  create_table "games", force: :cascade do |t|
    t.integer  "office_id"
    t.integer  "user_id"
    t.integer  "visitor_id"
    t.integer  "timeout"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "matched_at"
  end

  add_index "games", ["office_id"], name: "index_games_on_office_id"
  add_index "games", ["user_id"], name: "index_games_on_user_id"

  create_table "mods", force: :cascade do |t|
    t.integer "user_id"
    t.integer "office_id"
  end

  add_index "mods", ["user_id"], name: "index_mods_on_user_id"

  create_table "offices", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.boolean  "public"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company_name"
    t.string   "address"
  end

  create_table "offices_users", force: :cascade do |t|
    t.integer "office_id"
    t.integer "user_id"
    t.integer "mod_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
