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

ActiveRecord::Schema.define(version: 20161230085648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fields", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "levelnames", force: :cascade do |t|
    t.integer  "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "levels", force: :cascade do |t|
    t.integer  "field_id"
    t.integer  "mintariff"
    t.integer  "maxtariff"
    t.string   "name"
    t.text     "skill"
    t.text     "tool"
    t.text     "certificate"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "levelname_id"
  end

  add_index "levels", ["field_id"], name: "index_levels_on_field_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.integer  "level_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "projects", ["level_id"], name: "index_projects_on_level_id", using: :btree

  add_foreign_key "levels", "fields"
  add_foreign_key "projects", "levels"
end
