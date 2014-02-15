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

ActiveRecord::Schema.define(version: 20140215171310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contests", force: true do |t|
    t.string   "name"
    t.integer  "active_round"
    t.boolean  "posted",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api_key"
  end

  create_table "images", force: true do |t|
    t.string   "flickr_id"
    t.string   "owner"
    t.string   "title"
    t.string   "url"
    t.integer  "contest_id"
    t.integer  "round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["contest_id"], name: "index_images_on_contest_id", using: :btree
  add_index "images", ["round_id"], name: "index_images_on_round_id", using: :btree

  create_table "rounds", force: true do |t|
    t.integer  "number"
    t.string   "image_a"
    t.string   "image_b"
    t.integer  "contest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rounds", ["contest_id"], name: "index_rounds_on_contest_id", using: :btree

end
