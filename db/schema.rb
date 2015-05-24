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

ActiveRecord::Schema.define(version: 20150522231045) do

  create_table "games", force: :cascade do |t|
    t.integer  "office_id"
    t.integer  "user_id"
    t.integer  "visitor_id"
    t.integer  "timeout"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offices", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.boolean  "public"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company_name"
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
