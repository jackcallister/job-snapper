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

ActiveRecord::Schema.define(version: 20130520043244) do

  create_table "applications", force: true do |t|
    t.integer  "job_id"
    t.integer  "candidate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status"
    t.boolean  "star",         default: false
  end

  add_index "applications", ["job_id", "candidate_id"], name: "index_applications_on_job_id_and_candidate_id", unique: true, using: :btree

  create_table "candidate_profiles", force: true do |t|
    t.integer "candidate_id"
    t.integer "age"
    t.text    "about_me"
    t.text    "previous_work_experience"
    t.string  "name"
    t.string  "contact_number"
    t.integer "region_id"
    t.integer "city_id"
  end

  create_table "categories", force: true do |t|
    t.string "title", null: false
  end

  create_table "categorizations", force: true do |t|
    t.integer  "job_id",      null: false
    t.integer  "category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string  "name"
    t.integer "region_id"
  end

  create_table "classifications", force: true do |t|
    t.integer  "job_id",     null: false
    t.integer  "type_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "title",                    default: "", null: false
    t.string   "company"
    t.datetime "start_date"
    t.integer  "employer_id",                           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pay_rate_max"
    t.integer  "pay_rate_min"
    t.text     "summary"
    t.text     "description"
    t.text     "ideal_candidate"
    t.string   "contact_name"
    t.string   "contact_number"
    t.text     "application_instructions"
    t.integer  "region_id"
    t.integer  "city_id"
  end

  create_table "regions", force: true do |t|
    t.string "name"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "types", force: true do |t|
    t.string "title", null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
