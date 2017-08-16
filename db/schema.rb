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

ActiveRecord::Schema.define(version: 20170809193409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "building_mgmts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.string "street_address"
    t.string "neighborhood"
    t.string "state"
    t.integer "zipcode"
    t.bigint "building_mgmt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_mgmt_id"], name: "index_buildings_on_building_mgmt_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "comms_rating"
    t.integer "upkeep_rating"
    t.integer "speedy_rating"
    t.integer "quality_rating"
    t.string "body"
    t.string "comment"
    t.bigint "user_id"
    t.bigint "building_mgmt_id"
    t.bigint "building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_reviews_on_building_id"
    t.index ["building_mgmt_id"], name: "index_reviews_on_building_mgmt_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "buildings", "building_mgmts"
  add_foreign_key "reviews", "building_mgmts"
  add_foreign_key "reviews", "buildings"
  add_foreign_key "reviews", "users"
end
