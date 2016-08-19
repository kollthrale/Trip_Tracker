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

ActiveRecord::Schema.define(version: 20160819181242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street",      null: false
    t.string   "city",        null: false
    t.string   "state",       null: false
    t.integer  "zip",         null: false
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["location_id"], name: "index_addresses_on_location_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "category"
    t.string   "cost"
    t.string   "hours"
    t.integer  "tripp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tripp_id"], name: "index_locations_on_tripp_id", using: :btree
  end

  create_table "tripps", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "vacation",   default: true
    t.string   "date",                      null: false
    t.integer  "duration"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
