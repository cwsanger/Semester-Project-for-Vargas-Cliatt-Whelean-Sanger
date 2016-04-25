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

ActiveRecord::Schema.define(version: 20160425061925) do

  create_table "accounts", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "member_id"
    t.string   "member_type"
  end

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "advertisements", force: :cascade do |t|
    t.string   "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "business_id"
    t.string   "image_url"
  end

  create_table "agencies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_url"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
  end

  create_table "agencies_neighborhoods", force: :cascade do |t|
    t.integer "agency_id"
    t.integer "neighborhood_id"
  end

  create_table "alerts", force: :cascade do |t|
    t.string   "body"
    t.integer  "severity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "agency_id"
  end

  create_table "broadcasts", force: :cascade do |t|
    t.string   "body"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "neighborhood_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_url"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
  end

  create_table "businesses_neighborhoods", force: :cascade do |t|
    t.integer "business_id"
    t.integer "neighborhood_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 0
    t.string   "image_url"
  end

  create_table "direct_messages", force: :cascade do |t|
    t.integer  "to_id"
    t.integer  "from_id"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_url"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "neighborhood_id"
    t.integer  "user_id"
    t.string   "name"
    t.string   "body"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "image_url"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "neighborhood_id"
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  add_index "groups_users", ["user_id", "group_id"], name: "index_groups_users_on_user_id_and_group_id"

  create_table "likes", force: :cascade do |t|
    t.integer  "likeable_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "likeable_type"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "body"
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "body"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "image_url"
    t.integer  "status",      default: 0
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "requestable_id"
    t.string   "requestable_type"
    t.integer  "neighborhood_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "temp_agencies", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_url"
  end

  create_table "temp_businesses", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_url"
  end

  create_table "temp_neighborhoods", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "contact_email"
  end

  create_table "temp_users", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.integer "hood_id"
    t.string  "hood_type"
    t.string  "image_url"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "neighborhood_id"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "account_id"
    t.integer  "role",            default: 0
    t.integer  "points",          default: 0
    t.string   "image_url"
  end

end
