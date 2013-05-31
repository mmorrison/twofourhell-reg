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

ActiveRecord::Schema.define(version: 20130514031138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"
  enable_extension "uuid-ossp"

  create_table "profiles", id: false, force: true do |t|
    t.uuid     "id",            null: false
    t.string   "name"
    t.string   "email"
    t.string   "mobile"
    t.string   "tshirt_size"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "age_group"
    t.string   "status"
    t.string   "confirm_token"
  end

  create_table "teams", id: false, force: true do |t|
    t.uuid     "id",         null: false
    t.string   "name"
    t.boolean  "special"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vol_applications", id: false, force: true do |t|
    t.uuid     "id",                               null: false
    t.integer  "year"
    t.string   "preferred_teams",     default: [],              array: true
    t.string   "preferred_teammates",                           array: true
    t.string   "event_availability",  default: [],              array: true
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "volunteer_id"
  end

  create_table "volunteers", id: false, force: true do |t|
    t.uuid     "id",                                null: false
    t.uuid     "profile_id"
    t.string   "certifications",    default: [],                 array: true
    t.string   "equipment",         default: [],                 array: true
    t.string   "years_volunteered", default: [],                 array: true
    t.text     "qualification"
    t.text     "internal_notes"
    t.boolean  "starred?",          default: false
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
