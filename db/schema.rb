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

ActiveRecord::Schema.define(version: 20180707112008) do

  create_table "cast_members", force: :cascade do |t|
    t.string "name", null: false
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contributions", force: :cascade do |t|
    t.integer "episode_id"
    t.integer "cast_member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cast_member_id"], name: "index_contributions_on_cast_member_id"
    t.index ["episode_id"], name: "index_contributions_on_episode_id"
  end

  create_table "episodes", force: :cascade do |t|
    t.integer "episode_no", null: false
    t.string "title", null: false
    t.string "link", null: false
    t.string "description", null: false
    t.string "subtitle", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
