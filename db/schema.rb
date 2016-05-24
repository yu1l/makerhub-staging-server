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

ActiveRecord::Schema.define(version: 20160524165617) do

  create_table "chats", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "text"
    t.string   "sender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "chats", ["user_id"], name: "index_chats_on_user_id"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "follows", force: :cascade do |t|
    t.integer  "followable_id",                   null: false
    t.string   "followable_type",                 null: false
    t.integer  "follower_id",                     null: false
    t.string   "follower_type",                   null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables"
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows"

  create_table "ghs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "uid"
    t.string   "provider"
    t.string   "nickname"
    t.string   "email"
    t.string   "image"
    t.string   "blog_url"
    t.string   "profile_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
  end

  add_index "ghs", ["user_id"], name: "index_ghs_on_user_id"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.boolean  "private"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "uuid"
    t.boolean  "streaming"
  end

  create_table "records", force: :cascade do |t|
    t.string   "video_path"
    t.string   "screenshot_path"
    t.string   "uuid"
    t.boolean  "uploaded"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "title"
    t.float    "duration"
    t.integer  "total"
    t.integer  "category"
    t.boolean  "private"
    t.integer  "group_id"
  end

  add_index "records", ["group_id"], name: "index_records_on_group_id"
  add_index "records", ["user_id"], name: "index_records_on_user_id"

  create_table "tws", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "uid"
    t.string   "provider"
    t.string   "access_token"
    t.string   "access_token_secret"
    t.text     "description"
    t.string   "image"
    t.string   "location"
    t.string   "name"
    t.string   "nickname"
    t.string   "url"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "tws", ["user_id"], name: "index_tws_on_user_id"

  create_table "user_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_groups", ["group_id"], name: "index_user_groups_on_group_id"
  add_index "user_groups", ["user_id"], name: "index_user_groups_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "uuid"
    t.string   "name"
    t.string   "streaming_key"
    t.string   "title"
    t.boolean  "live",                   default: false
    t.text     "description"
    t.integer  "total"
    t.integer  "category"
    t.boolean  "github"
    t.string   "twitter_uid"
    t.string   "github_uid"
    t.boolean  "private"
    t.boolean  "twitter"
    t.string   "nickname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
